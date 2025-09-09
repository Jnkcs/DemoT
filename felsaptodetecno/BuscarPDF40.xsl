<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2003/05/soap-envelope"
    xmlns:temp="http://tempuri.org/"
    xmlns:b="http://schemas.datacontract.org/2004/07/cfdiWcfEmisionServicio.Clases"
    xmlns:i="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="s temp i b">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
    
    <!-- Template principal que coincide exactamente con el elemento que contiene los datos -->
    <xsl:template match="/">
        <xsl:apply-templates select="s:Envelope/s:Body/temp:Comprobante_BuscarPdf40Response/temp:Comprobante_BuscarPdf40Result"/>
    </xsl:template>
    
    <!-- Template para el resultado principal -->
    <xsl:template match="temp:Comprobante_BuscarPdf40Result">
        <Comprobante_BuscarPdf40Result>
            <xsl:apply-templates select="b:*[not(@i:nil='true')]"/>
        </Comprobante_BuscarPdf40Result>
    </xsl:template>
    
    <!-- Template para elementos con namespace b: que no sean nil -->
    <xsl:template match="b:*[not(@i:nil='true')]">
        <xsl:element name="{local-name()}">
            <xsl:choose>
                <!-- Si el elemento tiene hijos con namespace b:, procesarlos -->
                <xsl:when test="b:*">
                    <xsl:apply-templates select="b:*[not(@i:nil='true')]"/>
                </xsl:when>
                <!-- Si no, copiar el contenido de texto -->
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    <!-- Suprimir todos los demás nodos de texto para evitar contenido no deseado -->
    <xsl:template match="text()"/>
    
    <!-- Suprimir explícitamente elementos con i:nil="true" -->
    <xsl:template match="*[@i:nil='true']"/>
    
</xsl:stylesheet>