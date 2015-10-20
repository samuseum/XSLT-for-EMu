#! /usr/bin/python
import lxml.etree as ET
import os
import sys
import datetime
'''
This script is used to ensure the consistency of the taxonomic identifications in tissue
records from the ABTC which have been extracted from a voucher specimen held at the 
South Australian Museum

It gets the taxonomic identification of the tissue sample as well 
as the taxonomic identification of the source specimen. If they don't match a line is added
to the output csv with the irn of the tissue sample and the irn of the currently accepted 
identification of the source specimen.

The output of the script is a three-column csv with the header "irn,IdeTaxonRef_tab(-).irn,IdeCurrent_tab(-)" 
and zero or more lines of data. Each line prepends the new identification to the identification 
tab and marks it as the current identification

The output of this script should be imported back into EMu to fix up any identification issues. 
To inspect the differences before import search on the irns

The export should be run to return all records that have a value in SouVoucherHeldRef
Each record in the EMu XML file looks like this, add the fields to the report as necessary:
  <tuple>
    <atom name="irn">502322</atom>
    <tuple name="SouVoucherHeldRef">
      <atom name="irn">929</atom>
      <table name="IdeTaxonRef_tab">
        <tuple>
          <atom name="irn">49986</atom>
        </tuple>
        <tuple>
          <atom name="irn">1008</atom>
        </tuple>
      </table>
      <tuple name="IdeAcceptedRef">
        <atom name="irn">49986</atom>
      </tuple>
    </tuple>
    <table name="IdeTaxonRef_tab">
      <tuple>
        <atom name="irn">49986</atom>
      </tuple>
    </table>
  </tuple>
'''

# Generating a time string to use when creating the files
timestring = datetime.datetime.now().strftime("%y%m%d%H%M")

if (len(sys.argv) <> 2 ):
    sys.stderr.write('This filter should be called with 1 argument, the EMu XML file name')
    sys.exit(1)

if not (os.path.isfile(sys.argv[1])):
    sys.stderr.write('Source EMu XML file "%s" does not exist' % sys.argv[1]) 
    sys.exit(1)    

xmlsource = sys.argv[1]

stylesheet = ET.XML('''
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >  
    <xsl:output method="text" encoding="ISO-8859-1" />
    <xsl:strip-space elements="*" />
    <xsl:template match = "/">
        <xsl:text>irn,IdeTaxonRef_tab(-).irn,IdeCurrent_tab(-)</xsl:text>
        <xsl:text disable-output-escaping="yes">&#13;&#10;</xsl:text>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match = "/table/tuple">
        <xsl:choose>
            <xsl:when test="tuple[@name='SouVoucherHeldRef']/table[@name='IdeTaxonRef_tab']/tuple[1]/atom[@name='irn']=table[@name='IdeTaxonRef_tab']/tuple[1]/atom[@name='irn']">
            </xsl:when>
            <xsl:when test="tuple[@name='SouVoucherHeldRef']/tuple[@name='IdeAcceptedRef']/atom[@name='irn']=table[@name='IdeTaxonRef_tab']/tuple[1]/atom[@name='irn']">
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="atom[@name='irn']" /><xsl:text>,</xsl:text>
                <xsl:choose>
                    <xsl:when test="tuple[@name='SouVoucherHeldRef']/tuple[@name='IdeAcceptedRef']/atom[@name='irn']!=''">
                        <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='IdeAcceptedRef']/atom[@name='irn']" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/table[@name='IdeTaxonRef_tab']/tuple[1]/atom[@name='irn']" />
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>,Yes</xsl:text>
                <xsl:if test="position()!=last()">
                    <xsl:text disable-output-escaping="yes">&#13;&#10;</xsl:text>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>''')

    
dom = ET.parse(xmlsource)
#xslt = ET.parse(stylesheet)
transform = ET.XSLT(stylesheet)
newdom = transform(dom)

output = "ABTC_id_fixer"+timestring+".csv"

fd = os.open(output,os.O_CREAT|os.O_RDWR)

ret = os.write(fd,newdom)
os.close(fd)
sys.stdout.write(output)
