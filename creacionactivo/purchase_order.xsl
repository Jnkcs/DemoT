<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xj="http://camel.apache.org/component/xj"
                exclude-result-prefixes="xj">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <!-- Template principal -->
    <xsl:template match="/">
        <xsl:apply-templates select="//object[@xj:name='PurchaseOrderCreateFromData1']"/>
    </xsl:template>
    
    <!-- Template para PurchaseOrderCreateFromData1 -->
    <xsl:template match="object[@xj:name='PurchaseOrderCreateFromData1']">
        <PurchaseOrderCreateFromData1>
            <!-- Procesar PoHeader -->
            <xsl:apply-templates select="object[@xj:name='PoHeader']"/>
            
            <!-- Procesar PoHeaderX -->
            <xsl:apply-templates select="object[@xj:name='PoHeaderX']"/>
            
            <!-- Procesar PoItem -->
            <xsl:apply-templates select="object[@xj:name='PoItem']"/>
            
            <!-- Procesar PoItemX -->
            <xsl:apply-templates select="object[@xj:name='PoItemX']"/>
        </PurchaseOrderCreateFromData1>
    </xsl:template>
    
    <!-- Template para PoHeader -->
    <xsl:template match="object[@xj:name='PoHeader']">
        <PoHeader>
            <DocType><xsl:value-of select="object[@xj:name='DocType']"/></DocType>
            <Vendor><xsl:value-of select="object[@xj:name='Vendor']"/></Vendor>
            <PurchOrg><xsl:value-of select="object[@xj:name='PurchOrg']"/></PurchOrg>
            <PurGroup><xsl:value-of select="object[@xj:name='PurGroup']"/></PurGroup>
            <CompCode><xsl:value-of select="object[@xj:name='CompCode']"/></CompCode>
            <DocDate><xsl:value-of select="object[@xj:name='DocDate']"/></DocDate>
            <Pmnttrms><xsl:value-of select="object[@xj:name='Pmnttrms']"/></Pmnttrms>
            <Incoterms1><xsl:value-of select="object[@xj:name='Incoterms1']"/></Incoterms1>
            <Currency><xsl:value-of select="object[@xj:name='Currency']"/></Currency>
        </PoHeader>
    </xsl:template>
    
    <!-- Template para PoHeaderX -->
    <xsl:template match="object[@xj:name='PoHeaderX']">
        <PoHeaderX>
            <DocType><xsl:value-of select="object[@xj:name='DocType']"/></DocType>
            <Vendor><xsl:value-of select="object[@xj:name='Vendor']"/></Vendor>
            <PurchOrg><xsl:value-of select="object[@xj:name='PurchOrg']"/></PurchOrg>
            <PurGroup><xsl:value-of select="object[@xj:name='PurGroup']"/></PurGroup>
            <CompCode><xsl:value-of select="object[@xj:name='CompCode']"/></CompCode>
            <DocDate><xsl:value-of select="object[@xj:name='DocDate']"/></DocDate>
            <Pmnttrms><xsl:value-of select="object[@xj:name='Pmnttrms']"/></Pmnttrms>
            <Incoterms1><xsl:value-of select="object[@xj:name='Incoterms1']"/></Incoterms1>
            <Currency><xsl:value-of select="object[@xj:name='Currency']"/></Currency>
        </PoHeaderX>
    </xsl:template>
    
    <!-- Template para PoItem -->
    <xsl:template match="object[@xj:name='PoItem']">
        <PoItem>
            <xsl:for-each select="object[@xj:name='item']/object">
                <item>
                    <PoItem><xsl:value-of select="object[@xj:name='PoItem']"/></PoItem>
                    <Material><xsl:value-of select="object[@xj:name='Material']"/></Material>
                    <Plant><xsl:value-of select="object[@xj:name='Plant']"/></Plant>
                    <Quantity><xsl:value-of select="object[@xj:name='Quantity']"/></Quantity>
                    <PoUnit><xsl:value-of select="object[@xj:name='PoUnit']"/></PoUnit>
                    <NetPrice><xsl:value-of select="object[@xj:name='NetPrice']"/></NetPrice>
                    <PriceUnit><xsl:value-of select="object[@xj:name='PriceUnit']"/></PriceUnit>
                    <GrInd><xsl:value-of select="object[@xj:name='GrInd']"/></GrInd>
                    <IrInd><xsl:value-of select="object[@xj:name='IrInd']"/></IrInd>
                    <GrBasediv><xsl:value-of select="object[@xj:name='GrBasediv']"/></GrBasediv>
                </item>
            </xsl:for-each>
        </PoItem>
    </xsl:template>
    
    <!-- Template para PoItemX -->
    <xsl:template match="object[@xj:name='PoItemX']">
        <PoItemX>
            <xsl:for-each select="object[@xj:name='item']/object">
                <item>
                    <PoItem><xsl:value-of select="object[@xj:name='PoItem']"/></PoItem>
                    <Material><xsl:value-of select="object[@xj:name='Material']"/></Material>
                    <Plant><xsl:value-of select="object[@xj:name='Plant']"/></Plant>
                    <Quantity><xsl:value-of select="object[@xj:name='Quantity']"/></Quantity>
                    <PoUnit><xsl:value-of select="object[@xj:name='PoUnit']"/></PoUnit>
                    <NetPrice><xsl:value-of select="object[@xj:name='NetPrice']"/></NetPrice>
                    <PriceUnit><xsl:value-of select="object[@xj:name='PriceUnit']"/></PriceUnit>
                    <GrInd><xsl:value-of select="object[@xj:name='GrInd']"/></GrInd>
                    <IrInd><xsl:value-of select="object[@xj:name='IrInd']"/></IrInd>
                    <GrBasediv><xsl:value-of select="object[@xj:name='GrBasediv']"/></GrBasediv>
                </item>
            </xsl:for-each>
        </PoItemX>
    </xsl:template>
    
</xsl:stylesheet>