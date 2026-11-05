package services;

import org.apache.camel.Exchange;

import javax.naming.NamingEnumeration;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class BuscarUsuarioService {

    public Map<String, Object> ejecutar(Exchange exchange) {

        Map<String, Object> body = exchange.getIn().getBody(Map.class);
        String username = null;
        if (body != null) {
            Object u = body.get("usuario");
            if (u == null) {
                u = body.get("username");
            }
            if (u != null) {
                username = u.toString();
            }
        }

        if (username == null || username.trim().isEmpty()) {
            exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 400);

            Map<String, Object> response = new LinkedHashMap<>();
            response.put("encontrado", false);
            response.put("mensaje", "El campo 'usuario' es obligatorio.");
            return response;
        }

        String url = exchange.getContext().resolvePropertyPlaceholders("{{ldap.url}}");
        String principal = exchange.getContext().resolvePropertyPlaceholders("{{ldap.principal}}");
        String password = exchange.getContext().resolvePropertyPlaceholders("{{ldap.credentials}}");
        String baseDn = exchange.getContext().resolvePropertyPlaceholders("{{ldap.baseDn}}");

        DirContext ctx = null;

        try {
            ctx = LdapHelper.getContext(url, principal, password);

            SearchControls searchControls = new SearchControls();
            searchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);
            // TODOS los atributos LDAP, igual que en Groovy
            searchControls.setReturningAttributes(null);

            String filter = "(&(objectCategory=person)(objectClass=user)(sAMAccountName=" + username.trim() + "))";

            NamingEnumeration<SearchResult> results = ctx.search(baseDn, filter, searchControls);

            if (results != null && results.hasMore()) {

                SearchResult searchResult = results.next();
                Attributes attrs = searchResult.getAttributes();

                // --- Construcción de allData, igual que en Groovy ---
                Set<String> excludedAttrs = new HashSet<>(Arrays.asList(
                    "objectGUID",
                    "objectSid",
                    "mS-DS-ConsistencyGuid",
                    "nTSecurityDescriptor",
                    "userCertificate"
                ));

                Map<String, Object> allData = new LinkedHashMap<>();

                NamingEnumeration<? extends Attribute> enumeration = attrs.getAll();
                while (enumeration.hasMore()) {
                    Attribute attr = enumeration.next();

                    if (excludedAttrs.contains(attr.getID())) {
                        continue;
                    }

                    List<String> values = new ArrayList<>();
                    NamingEnumeration<?> valEnum = attr.getAll();
                    while (valEnum.hasMore()) {
                        values.add(String.valueOf(valEnum.next()));
                    }

                    allData.put(attr.getID(), values.size() == 1 ? values.get(0) : values);
                }

                exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 200);

                Map<String, Object> response = new LinkedHashMap<>();
                response.put("encontrado", true);
                response.put("usuario", getVal(attrs, "sAMAccountName"));

                String nombre = getVal(attrs, "displayName");
                if (nombre == null) nombre = getVal(attrs, "cn");
                response.put("nombre", nombre);

                String correo = getVal(attrs, "userPrincipalName");
                if (correo == null) correo = getVal(attrs, "mail");
                response.put("correo", correo);

                response.put("puesto", getVal(attrs, "title"));
                response.put("departamento", getVal(attrs, "department"));
                response.put("oficina", getVal(attrs, "physicalDeliveryOfficeName"));
                response.put("pais", getVal(attrs, "co"));
                response.put("telefono", getVal(attrs, "telephoneNumber"));
                response.put("distinguishedName", searchResult.getNameInNamespace());
                response.put("allData", allData);

                return response;

            } else {
                exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 404);

                Map<String, Object> response = new LinkedHashMap<>();
                response.put("encontrado", false);
                response.put("mensaje", "El usuario '" + username + "' no existe en Active Directory.");
                return response;
            }

        } catch (Exception e) {
            exchange.getIn().setHeader(Exchange.HTTP_RESPONSE_CODE, 500);

            Map<String, Object> response = new LinkedHashMap<>();
            response.put("encontrado", false);
            response.put("tipoError", e.getClass().getName());
            response.put("mensaje", e.getMessage());
            response.put("causa", e.getCause() != null ? e.getCause().getMessage() : null);
            return response;

        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignored) {
                }
            }
        }
    }

    private String getVal(Attributes attrs, String attrId) {
        try {
            Attribute attr = attrs.get(attrId);
            if (attr != null && attr.get() != null) {
                return attr.get().toString();
            }
        } catch (Exception ignored) {
        }
        return null;
    }
}