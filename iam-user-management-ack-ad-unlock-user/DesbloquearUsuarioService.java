package services;

import org.apache.camel.Exchange;

import javax.naming.NamingEnumeration;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import java.util.LinkedHashMap;
import java.util.Map;

public class DesbloquearUsuarioService {

    public Map<String, Object> ejecutar(Exchange exchange) {
        String username = exchange.getIn().getHeader("targetUser", String.class);
        if (username == null || username.trim().isEmpty()) {
            Map<String, Object> body = exchange.getIn().getBody(Map.class);
            if (body != null) {
                Object u = body.get("usuario");
                if (u == null) u = body.get("username");
                if (u != null) username = u.toString();
            }
        }

        if (username == null || username.trim().isEmpty()) {
            exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 400);
            Map<String, Object> response = new LinkedHashMap<>();
            response.put("exito", false);
            response.put("mensaje", "El campo usuario es obligatorio.");
            return response;
        }

        String url = exchange.getContext().resolvePropertyPlaceholders("{{ldap.url}}");
        String principal = exchange.getContext().resolvePropertyPlaceholders("{{ldap.principal}}");
        String password = exchange.getContext().resolvePropertyPlaceholders("{{ldap.credentials}}");
        String baseDn = exchange.getContext().resolvePropertyPlaceholders("{{ldap.baseDn}}");

        DirContext ctx = null;
        try {
            ctx = LdapHelper.getContext(url, principal, password);

            SearchControls sc = new SearchControls();
            sc.setSearchScope(SearchControls.SUBTREE_SCOPE);
            sc.setReturningAttributes(new String[]{"sAMAccountName", "lockoutTime", "userAccountControl", "distinguishedName"});

            String filter = "(&(objectCategory=person)(objectClass=user)(sAMAccountName=" + username.trim() + "))";
            NamingEnumeration<SearchResult> results = ctx.search(baseDn, filter, sc);

            if (results == null || !results.hasMore()) {
                exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 404);
                Map<String, Object> response = new LinkedHashMap<>();
                response.put("exito", false);
                response.put("mensaje", "El usuario '" + username + "' no existe en Active Directory.");
                return response;
            }

            SearchResult sr = results.next();
            Attributes attrs = sr.getAttributes();
            String userDn = sr.getNameInNamespace();

            Map<String, Object> result = DesbloquearAccionService.ejecutarDesbloqueo(ctx, userDn, attrs);

            boolean exito = Boolean.TRUE.equals(result.get("exito"));
            if (exito || "ERROR el usuario se encuentra activo".equals(result.get("mensaje"))) {
                exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 200);
            } else {
                exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 400);
            }

            result.put("usuario", username);
            return result;

        } catch (Exception e) {
            exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 500);
            Map<String, Object> response = new LinkedHashMap<>();
            response.put("exito", false);
            response.put("tipoError", e.getClass().getName());
            response.put("mensaje", e.getMessage());
            response.put("causa", e.getCause() != null ? e.getCause().getMessage() : null);
            return response;
        } finally {
            if (ctx != null) {
                try { ctx.close(); } catch (Exception ignored) {}
            }
        }
    }
}