<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:output method="xml" encoding="ISO-8859-1"/>

A large number of tissue records had registration numbers added for their 
source specimens. Those source specimens had not yet been registered. This 
report was to add the source specimens to the database.

All the fields that had values in them were to be transferred across to the source specimen (collection date, identification, collector etc. ) An XSLT report was generated with all the fields that had to be transferred across to the record and this file as the XSL report. This transform takes the value in SouRegistrationNumber
and generates a Prefix and registration numeber from them. It also adds a few other fields to make them appropriate for the Herpetology collection.

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="/table/tuple/atom[@name = 'irn']"/>

    <xsl:template match="atom[@name = 'CatPrefix']/text()">
        <xsl:text>R</xsl:text>
    </xsl:template>

    <xsl:template match="atom[@name = 'CatRegNumber']"/>

    <xsl:template match="atom[@name = 'SouRegistrationNumber']">
        <xsl:copy>
            <xsl:attribute name="name">CatRegNumber</xsl:attribute>
            <xsl:value-of select="substring-after(., 'R')"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="atom[@name = 'CatObjectType']/text()">
        <xsl:text>PreservedSpecimen</xsl:text>
    </xsl:template>

    <xsl:template match="atom[@name = 'CatCollectionName']/text()">
        <xsl:text>Herpetology</xsl:text>
    </xsl:template>

    <xsl:template match="atom[@name = 'CatOtherNumbersSource']/text()">
        <xsl:text>Collector</xsl:text>
    </xsl:template>

    <xsl:template match="atom[@name = 'SecDepartment']/text()">
        <xsl:text>Herpetology</xsl:text>
    </xsl:template>

    <xsl:template match="atom[@name = 'SecLookupRoot']/text()">
        <xsl:text>Herpetology</xsl:text>
    </xsl:template>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
