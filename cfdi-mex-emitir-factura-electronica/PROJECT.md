#Payload Emitir FEL
<soapenv:Envelope xmlns:soapenv="http://xmlsoap.org" xmlns:cfdi="http://sat.gob.mx">
	<soapenv:Header/>
	<soapenv:Body>
		<cfdi:EmitirCFDIRequest>
			<cfdi:Usuario>USR_SAP_MX</cfdi:Usuario>
			<cfdi:Token>tok_mock_987654321</cfdi:Token>
			<cfdi:Comprobante>
				<cfdi:TipoDeComprobante>I</cfdi:TipoDeComprobante>
				<cfdi:Fecha>2026-11-12T11:07:00</cfdi:Fecha>
				<cfdi:Moneda>MXN</cfdi:Moneda>
				<cfdi:FormaPago>03</cfdi:FormaPago>
				<cfdi:MetodoPago>PUE</cfdi:MetodoPago>
				<cfdi:Exportacion>01</cfdi:Exportacion>
				<cfdi:Emisor>
					<cfdi:RfcEmisor>EKU9003173C9</cfdi:RfcEmisor>
					<cfdi:NombreEmisor>ESCUELA KEMPER URGATE</cfdi:NombreEmisor>
					<cfdi:RegimenFiscal>601</cfdi:RegimenFiscal>
					<cfdi:LugarExpedicion>06600</cfdi:LugarExpedicion>
				</cfdi:Emisor>
				<cfdi:Receptor>
					<cfdi:RfcReceptor>URE180429TM6</cfdi:RfcReceptor>
					<cfdi:NombreReceptor>UNIVERSIDAD ROBOTICA ESPAÑOLA</cfdi:NombreReceptor>
					<cfdi:DomicilioFiscalReceptor>65000</cfdi:DomicilioFiscalReceptor>
					<cfdi:RegimenFiscalReceptor>601</cfdi:RegimenFiscalReceptor>
					<cfdi:UsoCFDI>G03</cfdi:UsoCFDI>
					<cfdi:CorreoReceptor>facturacion@ure.edu.mx</cfdi:CorreoReceptor>
				</cfdi:Receptor>
				<cfdi:Conceptos>
					<cfdi:ClaveProdServ>43232408</cfdi:ClaveProdServ>
					<cfdi:Descripcion>Licencia de Software Empresarial</cfdi:Descripcion>
					<cfdi:Cantidad>1.00</cfdi:Cantidad>
					<cfdi:ClaveUnidad>E48</cfdi:ClaveUnidad>
					<cfdi:ValorUnitario>1000.00</cfdi:ValorUnitario>
					<cfdi:Importe>1000.00</cfdi:Importe>
					<cfdi:ObjetoImp>02</cfdi:ObjetoImp>
					<cfdi:TasaIVA>0.160000</cfdi:TasaIVA>
				</cfdi:Conceptos>
				<cfdi:SubTotal>1000.00</cfdi:SubTotal>
				<cfdi:TotalImpuestosTrasladados>160.00</cfdi:TotalImpuestosTrasladados>
				<cfdi:Total>1160.00</cfdi:Total>
			</cfdi:Comprobante>
		</cfdi:EmitirCFDIRequest>
	</soapenv:Body>
</soapenv:Envelope>


#Payload Anular
<soapenv:Envelope xmlns:soapenv="http://xmlsoap.org" xmlns:cfdi="http://sat.gob.mx">
	<soapenv:Header/>
	<soapenv:Body>
		<cfdi:CancelarCFDIRequest>
			<cfdi:Usuario>USR_SAP_MX</cfdi:Usuario>
			<cfdi:Token>tok_mock_987654321</cfdi:Token>
			<cfdi:UUID>550e8400-e29b-41d4-a716-446655440000</cfdi:UUID>
			<cfdi:Motivo>02</cfdi:Motivo>
			<cfdi:RfcEmisor>EKU9003173C9</cfdi:RfcEmisor>
		</cfdi:CancelarCFDIRequest>
	</soapenv:Body>
</soapenv:Envelope>
