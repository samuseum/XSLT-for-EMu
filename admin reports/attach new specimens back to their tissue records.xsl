<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" encoding="ISO-8859-1"/>



    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="atom[@name = 'SouRegistrationNumber']">
        <tuple>
            <xsl:attribute name="name">SouVoucherHeldRef</xsl:attribute>
            <atom>
                <xsl:attribute name="name">CatRegNumber</xsl:attribute>
                <xsl:value-of select="substring-after(., 'R')"/>
            </atom>
            <atom>
                <xsl:attribute name="name">CatPrefix</xsl:attribute>
                <xsl:text>R</xsl:text>
            </atom>
        </tuple>
    </xsl:template>

    <xsl:template match="tuple[@name = 'SouVoucherHeldRef']"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
