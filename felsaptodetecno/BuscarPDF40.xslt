<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2003/05/soap-envelope"
    xmlns:a="http://www.w3.org/2005/08/addressing"
    xmlns:temp="http://tempuri.org/"
    xmlns:b="http://schemas.datacontract.org/2004/07/cfdiWcfEmisionServicio.Clases"
    exclude-result-prefixes="s a temp b">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <datosFactura>
            <xsl:apply-templates select="//b:FacturaId | //b:PDF64"/>
        </datosFactura>
    </xsl:template>

    <xsl:template match="b:FacturaId">
        <facturaId>
            <xsl:value-of select="."/>
        </facturaId>
    </xsl:template>

    <xsl:template match="b:PDF64">
        <pdfBase64>
            <xsl:value-of select="."/>
        </pdfBase64>
    </xsl:template>

</xsl:stylesheet>