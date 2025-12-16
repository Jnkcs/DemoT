<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap-env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:n0="urn:sap-com:document:sap:rfc:functions" exclude-result-prefixes="soap-env n0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<!-- Envolvemos en un elemento raíz adicional -->
		<root>
			<xsl:apply-templates select="//n0:ZBAPI_CUSTOMER_CREATEFROMDATA1Response"/>
		</root>
	</xsl:template>
	<xsl:template match="n0:ZBAPI_CUSTOMER_CREATEFROMDATA1Response">
		<ZBAPI_CUSTOMER_CREATEFROMDATA1Response>
			<xsl:apply-templates select="node()"/>
		</ZBAPI_CUSTOMER_CREATEFROMDATA1Response>
	</xsl:template>
	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>