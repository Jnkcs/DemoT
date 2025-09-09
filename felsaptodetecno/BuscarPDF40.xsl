<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2003/05/soap-envelope"
    xmlns:a="http://www.w3.org/2005/08/addressing">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/s:Envelope/s:Body">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="text() | @* | /s:Envelope/s:Header"/>

</xsl:stylesheet>