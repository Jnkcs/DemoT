<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2003/05/soap-envelope"
    exclude-result-prefixes="s">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:copy-of select="/s:Envelope/s:Body/*[1]"/>
    </xsl:template>
    
</xsl:stylesheet>