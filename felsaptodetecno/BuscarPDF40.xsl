<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2003/05/soap-envelope"
    xmlns:temp="http://tempuri.org/"
    xmlns:b="http://schemas.datacontract.org/2004/07/cfdiWcfEmisionServicio.Clases"
    xmlns:i="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="s temp i">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/s:Envelope/s:Body/temp:Comprobante_BuscarPdf40Response/temp:Comprobante_BuscarPdf40Result">
        <Comprobante_BuscarPdf40Result xmlns:b="http://schemas.datacontract.org/2004/07/cfdiWcfEmisionServicio.Clases" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
            <xsl:apply-templates select="b:*"/>
        </Comprobante_BuscarPdf40Result>
    </xsl:template>

    <xsl:template match="b:*">
        <xsl:if test="not(@i:nil = 'true')">
            <xsl:element name="{local-name()}">
                <xsl:copy-of select="*|text()"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>