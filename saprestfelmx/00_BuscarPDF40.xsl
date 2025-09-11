<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2003/05/soap-envelope"
    xmlns:a="http://www.w3.org/2005/08/addressing">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <!-- Template principal que busca el elemento Body -->
    <xsl:template match="/">
        <xsl:apply-templates select="//s:Body"/>
    </xsl:template>
    
    <!-- Template que copia el contenido del Body -->
    <xsl:template match="s:Body">
        <!-- Copia todo el contenido dentro del Body -->
        <xsl:copy-of select="*"/>
    </xsl:template>
    
</xsl:stylesheet>