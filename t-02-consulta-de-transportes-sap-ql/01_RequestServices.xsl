<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xj="http://camel.apache.org/component/xj" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:sap-com:document:sap:rfc:functions" exclude-result-prefixes="xj xsl">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Parámetro para determinar el método a invocar -->
	<!-- Debe pasarse desde Camel, por ejemplo: ?operation=CONSULTA -->
	<xsl:param name="operation"/>
	<xsl:template match="/object">
		<soapenv:Envelope>
			<soapenv:Header/>
			<soapenv:Body>
				<xsl:choose>
					<!-- Si el parámetro operation es CONSULTA -->
					<xsl:when test="$operation = 'CONSULTA'">
						<urn:ZFSD_CONSULTA_TRANSPORTE_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_CONSULTA_TRANSPORTE_WS']/node()"/>
						</urn:ZFSD_CONSULTA_TRANSPORTE_WS>
					</xsl:when>
					<!-- Si el parámetro operation es VINCULA -->
					<xsl:when test="$operation = 'VINCULA'">
						<urn:ZFSD_VINCULA_TRANSPORTE_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_VINCULA_TRANSPORTE_WS']/node()"/>
						</urn:ZFSD_VINCULA_TRANSPORTE_WS>
					</xsl:when>
					<xsl:when test="$operation = 'CONFIRMACION_ENTREGA'">
						<urn:ZFSD_CONFI_ENTREGAS_TR_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_CONFI_ENTREGAS_TR_WS']/node()"/>
						</urn:ZFSD_CONFI_ENTREGAS_TR_WS>
					</xsl:when>
					<xsl:when test="$operation = 'LLEGADA_BASCULA'">
						<urn:ZFSD_LLEGADA_BASCULA_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_LLEGADA_BASCULA_WS']/node()"/>
						</urn:ZFSD_LLEGADA_BASCULA_WS>
					</xsl:when>
					<xsl:when test="$operation = 'DESVINCULAR_ENTREGA'">
						<urn:ZFSD_DESVINCULA_TRAN_ENTRE_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_DESVINCULA_TRAN_ENTRE_WS']/node()"/>
						</urn:ZFSD_DESVINCULA_TRAN_ENTRE_WS>
					</xsl:when>
					<xsl:when test="$operation = 'CONSULTA_ENTREGAS_TRANSPORTE'">
						<urn:ZFSD_CONSULTA_ENTREGAS_TR_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_CONSULTA_ENTREGAS_TR_WS']/node()"/>
						</urn:ZFSD_CONSULTA_ENTREGAS_TR_WS>
					</xsl:when>
					<xsl:when test="$operation = 'CONSULTA_VISUALIZAR_DETALLES'">
						<urn:ZFSD_CONSULTA_TR_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_CONSULTA_TR_WS']/node()"/>
						</urn:ZFSD_CONSULTA_TR_WS>
					</xsl:when>
					<xsl:when test="$operation = 'CONFIRMAR_ACTUALIZACION'">
						<urn:ZFSD_CONFI_ENT_TR_WS>
							<xsl:apply-templates select="object[@xj:name='ZFSD_CONFI_ENT_TR_WS']/node()"/>
						</urn:ZFSD_CONFI_ENT_TR_WS>
					</xsl:when>
					<!-- Si no se especifica operation, intentar detectar automáticamente -->
					<xsl:otherwise>
					<Error>Respuesta SAP no reconocida</Error>
				    </xsl:otherwise>
				</xsl:choose>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
	<!-- Template para detección automática basada en el nombre del objeto -->
	<xsl:template match="object[@xj:name]" mode="auto">
		<xsl:element name="urn:{@xj:name}">
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	<!-- Templates principales para procesar objetos anidados -->
	<xsl:template match="object[@xj:name]">
		<xsl:element name="{@xj:name}">
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	<!-- Copiar nodos normales -->
	<xsl:template match="node()">
		<xsl:copy>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<!-- Ignorar atributos xj:* -->
	<xsl:template match="@xj:*"/>
	<!-- Evitar procesar el objeto raíz dos veces -->
	<xsl:template match="/object/object[@xj:name]"/>
</xsl:stylesheet>