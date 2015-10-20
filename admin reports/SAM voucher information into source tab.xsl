<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="csv" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
    

    <!--xsl version ="2.0" and output method ="csv" makes the xslt processor return the file with csv as the extension. 
    -->

   <!--This report returns a CSV that can be imported to add the information from the voucher specimen into the tissue record. 
   It should be run from the tissue records - search for '+' in Voucher held in SAM and !* in one of the source details fields
   An Error line will be returned for any record that already has a value in one of the source details fields so have a look at the csv
   before importing it. If you forget to check before importing those records will return an error - the first column, irn, needs to be an integer-->
   
    <xsl:template match="/">
        <xsl:text>"irn","SouSourceInstitutionRef.irn","SouInstitutionCode","SouCollectionCode","SouRegistrationNumber"</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="/table/tuple">
        <xsl:choose>

            <xsl:when test="tuple[@name = 'SouSourceInstitutionRef']/atom[@name = 'irn'] != ''">
                <xsl:text>SOURCE INSTITUTION RECORDED</xsl:text>
            </xsl:when>
            <xsl:when test="atom[@name = 'SouInstitutionCode'] != ''">
                <xsl:text>INSTITUTION CODE RECORDED</xsl:text>
            </xsl:when>
            <xsl:when test="atom[@name = 'SouCollectionCode'] != ''">
                <xsl:text>COLLECTION CODE RECORDED</xsl:text>
            </xsl:when>
            <xsl:when test="atom[@name = 'SouRegistrationNumber'] != ''">
                <xsl:text>REGISTRATION NUMBER RECORDED</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="atom[@name = 'irn']"/>
                <xsl:text>","</xsl:text>
                <xsl:text>14194</xsl:text>
                <xsl:text>","</xsl:text>
                <xsl:text>SAMA</xsl:text>
                <xsl:text>","</xsl:text>
                <xsl:value-of
                    select="tuple[@name = 'SouVoucherHeldRef']/atom[@name = 'CatCollectionName_tab']"/>
                <xsl:text>","</xsl:text>

                <xsl:value-of
                    select="concat(tuple[@name = 'SouVoucherHeldRef']/atom[@name = 'CatPrefix'], tuple[@name = 'SouVoucherHeldRef']/atom[@name = 'CatRegNumber'])"/>
                <xsl:text>"</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>&#xa;</xsl:text>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
