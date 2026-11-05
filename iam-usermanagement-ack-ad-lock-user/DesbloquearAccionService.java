package services;

import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.BasicAttribute;
import javax.naming.directory.DirContext;
import javax.naming.directory.ModificationItem;
import java.util.LinkedHashMap;
import java.util.Map;

public class DesbloquearAccionService {

    public static Map<String, Object> ejecutarDesbloqueo(DirContext ctx, String userDn, Attributes attrs) {
        Map<String, Object> response = new LinkedHashMap<>();
        try {
            Attribute lockoutAttr = attrs.get("lockoutTime");
            Attribute uacAttr = attrs.get("userAccountControl");

            String lockoutStr = (lockoutAttr != null && lockoutAttr.get() != null) ? lockoutAttr.get().toString() : "0";
            String uacStr = (uacAttr != null && uacAttr.get() != null) ? uacAttr.get().toString() : "512";

            long lockoutTime = 0L;
            int uac = 512;
            try { lockoutTime = Long.parseLong(lockoutStr); } catch (Exception ignored) {}
            try { uac = Integer.parseInt(uacStr); } catch (Exception ignored) {}

            boolean isNormalAccount = (uac & 512) != 0;
            if (!isNormalAccount) {
                response.put("exito", false);
                response.put("mensaje", "El usuario no es una cuenta normal estándar (no posee el flag 512 / NORMAL_ACCOUNT).");
                return response;
            }

            boolean isLocked = lockoutTime > 0L;

            if (!isLocked) {
                response.put("exito", false);
                response.put("mensaje", "ERROR el usuario se encuentra activo");
                return response;
            }

            ModificationItem[] mods = new ModificationItem[]{
                new ModificationItem(DirContext.REPLACE_ATTRIBUTE, new BasicAttribute("lockoutTime", "0"))
            };

            ctx.modifyAttributes(userDn, mods);

            response.put("exito", true);
            response.put("mensaje", "El usuario ha sido desbloqueado exitosamente.");
            return response;

        } catch (Exception e) {
            response.put("exito", false);
            response.put("tipoError", e.getClass().getSimpleName());
            response.put("mensaje", e.getCause() != null ? e.getCause().getMessage() : e.getMessage());
            return response;
        }
    }
}
