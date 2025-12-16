<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xj="http://camel.apache.org/component/xj" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:sap-com:document:sap:rfc:functions" exclude-result-prefixes="xj xsl">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/object">
		<soapenv:Envelope>
			<soapenv:Header/>
			<soapenv:Body>
				<urn:ZBAPI_CUSTOMER_CREATEFROMDATA1>
					<xsl:apply-templates select="object[@xj:name='ZBAPI_CUSTOMER_CREATEFROMDATA1']/node()"/>
				</urn:ZBAPI_CUSTOMER_CREATEFROMDATA1>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
	<xsl:template match="object[@xj:name]">
		<xsl:element name="{@xj:name}">
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@xj:*"/>
	<xsl:template match="/object/object[@xj:name]"/>
</xsl:stylesheet>