<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2003/05/soap-envelope"
    xmlns:temp="http://tempuri.org/"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:copy-of select="s:Envelope/s:Body/temp:ComprobanteGenerarSAT40Response"/>
    </xsl:template>
    
</xsl:stylesheet>