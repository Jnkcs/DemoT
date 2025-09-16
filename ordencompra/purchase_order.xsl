<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xj="http://camel.apache.org/component/xj"
    exclude-result-prefixes="xj">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- Template principal -->
    <xsl:template match="/">
        <xsl:element name="PurchaseOrderCreateFromData1">
            <xsl:apply-templates select="//object[@xj:name='PurchaseOrderCreateFromData1']"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Template para PurchaseOrderCreateFromData1 -->
    <xsl:template match="object[@xj:name='PurchaseOrderCreateFromData1']">
        <xsl:apply-templates select="object[@xj:name='PoHeader']"/>
        <xsl:apply-templates select="object[@xj:name='PoHeaderX']"/>
        <xsl:apply-templates select="object[@xj:name='PoItem']"/>
        <xsl:apply-templates select="object[@xj:name='PoItemX']"/>
    </xsl:template>
    
    <!-- Template para PoHeader -->
    <xsl:template match="object[@xj:name='PoHeader']">
        <xsl:element name="PoHeader">
            <xsl:apply-templates select="object"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Template para PoHeaderX -->
    <xsl:template match="object[@xj:name='PoHeaderX']">
        <xsl:element name="PoHeaderX">
            <xsl:apply-templates select="object"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Template para PoItem -->
    <xsl:template match="object[@xj:name='PoItem']">
        <xsl:element name="PoItem">
            <xsl:apply-templates select="object[@xj:name='item']/object"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Template para PoItemX -->
    <xsl:template match="object[@xj:name='PoItemX']">
        <xsl:element name="PoItemX">
            <xsl:apply-templates select="object[@xj:name='item']/object"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Template para items dentro del array -->
    <xsl:template match="object[@xj:name='item']/object">
        <xsl:element name="item">
            <xsl:apply-templates select="object"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Template genérico para elementos simples -->
    <xsl:template match="object[@xj:type='string']">
        <xsl:element name="{@xj:name}">
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>