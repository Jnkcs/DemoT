<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap-env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:n0="urn:sap-com:document:sap:rfc:functions" exclude-result-prefixes="soap-env n0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<Root>
			<xsl:choose>
				<xsl:when test="//n0:ZFSD_VINCULA_TRANSPORTE_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_VINCULA_TRANSPORTE_WSResponse"/>
				</xsl:when>
				<xsl:when test="//n0:ZFSD_CONSULTA_TRANSPORTE_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_CONSULTA_TRANSPORTE_WSResponse"/>
				</xsl:when>
				<xsl:when test="//n0:ZFSD_CONFI_ENTREGAS_TR_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_CONFI_ENTREGAS_TR_WSResponse"/>
				</xsl:when>
				<xsl:when test="//n0:ZFSD_LLEGADA_BASCULA_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_LLEGADA_BASCULA_WSResponse"/>
				</xsl:when>
				<xsl:when test="//n0:ZFSD_DESVINCULA_TRAN_ENTRE_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_DESVINCULA_TRAN_ENTRE_WSResponse"/>
				</xsl:when>
				<xsl:when test="//n0:ZFSD_CONSULTA_ENTREGAS_TR_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_CONSULTA_ENTREGAS_TR_WSResponse"/>
				</xsl:when>
				<xsl:when test="//n0:ZFSD_CONSULTA_TR_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_CONSULTA_TR_WSResponse"/>
				</xsl:when>
				<xsl:when test="//n0:ZFSD_CONFI_ENT_TR_WSResponse">
					<xsl:apply-templates select="//n0:ZFSD_CONFI_ENT_TR_WSResponse"/>
				</xsl:when>
				<xsl:otherwise>
					<Error>Respuesta SAP no reconocida</Error>
				</xsl:otherwise>
			</xsl:choose>
		</Root>
	</xsl:template>
	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="text()|@*">
		<xsl:copy/>
	</xsl:template>
</xsl:stylesheet>