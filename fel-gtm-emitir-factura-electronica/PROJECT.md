#Anular FEL
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:fel="http://fel.sat.gob.gt/">
  <soapenv:Header/>
  <soapenv:Body>
    <fel:AnularFELRequest>
      <Usuario>fel.guatemala@certificador.gt</Usuario>
      <Token>8f3a2b9c-41d7-4e9a-9c1f-7a2b3c4d5e6f</Token>
      <UUID>9a4b7c2e-5f1a-4d8b-9e3c-2a1b4c5d6e7f</UUID>
      <Motivo>Se facturó con NIT incorrecto, cliente solicitó corrección. NIT correcto 84567213</Motivo>
      <NitEmisor>98456321</NitEmisor>
    </fel:AnularFELRequest>
  </soapenv:Body>
</soapenv:Envelope>

#Emitir FEL
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:fel="http://fel.sat.gob.gt/">
  <soapenv:Header/>
  <soapenv:Body>
    <fel:EmitirFELRequest>
      <Usuario>fel.guatemala@certificador.gt</Usuario>
      <Token>8f3a2b9c-41d7-4e9a-9c1f-7a2b3c4d5e6f</Token>
      <Factura>
        <TipoDocumento>FACT</TipoDocumento>
        <FechaEmision>2026-11-11T09:42:15</FechaEmision>
        <Moneda>GTQ</Moneda>
        <Emisor>
          <NitEmisor>98456321</NitEmisor>
          <NombreEmisor>DISTRIBUIDORA LOS ALAMOS S.A.</NombreEmisor>
          <DireccionEmisor>12 Avenida 18-45 Zona 10, Guatemala, GT</DireccionEmisor>
          <CodigoEstablecimiento>1</CodigoEstablecimiento>
          <NombreComercial>Los Alamos</NombreComercial>
        </Emisor>
        <Receptor>
          <NitReceptor>84567213</NitReceptor>
          <NombreReceptor>MARIA FERNANDA LOPEZ GARCIA</NombreReceptor>
          <DireccionReceptor>6a Calle 4-22 Zona 1, Mixco, Guatemala, GT</DireccionReceptor>
          <CorreoReceptor>maria.lopez.garcia@gmail.com</CorreoReceptor>
        </Receptor>
        <Items>
          <Descripcion>Servicio de mantenimiento preventivo de equipo de cómputo - Laptop HP ProBook 440</Descripcion>
          <Cantidad>1</Cantidad>
          <UnidadMedida>Servicio</UnidadMedida>
          <PrecioUnitario>850.00</PrecioUnitario>
          <Descuento>0.00</Descuento>
          <MontoTotal>850.00</MontoTotal>
          <CodigoImpuesto>IVA</CodigoImpuesto>
        </Items>
        <Items>
          <Descripcion>Repuesto - Disco SSD 512GB Kingston NV2</Descripcion>
          <Cantidad>1</Cantidad>
          <UnidadMedida>Unidad</UnidadMedida>
          <PrecioUnitario>675.00</PrecioUnitario>
          <Descuento>25.00</Descuento>
          <MontoTotal>650.00</MontoTotal>
          <CodigoImpuesto>IVA</CodigoImpuesto>
        </Items>
        <SubTotal>1339.29</SubTotal>
        <TotalIVA>160.71</TotalIVA>
        <Total>1500.00</Total>
        <Observaciones>Factura por servicio realizado el 10/11/2026, garantía 90 días. Contacto: 5555-1234</Observaciones>
      </Factura>
    </fel:EmitirFELRequest>
  </soapenv:Body>
</soapenv:Envelope>