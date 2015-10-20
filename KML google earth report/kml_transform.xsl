<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
        xmlns:kml="http://www.opengis.net/kml/2.2"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        >
    <xsl:output method="kml" indent="yes"/>

    <xsl:template match="/">
        <kml xmlns="http://www.opengis.net/kml/2.2">
            <Document>
                <name>South Australian Museum data</name>
                <Style id="default">
                    <IconStyle>
                        <Icon>
                            <href>http://maps.google.com/mapfiles/kml/pushpin/grn-pushpin.png</href>
                        </Icon>
                    </IconStyle>
                </Style>
                <Style id="nocoords">
                    <IconStyle>
                        <Icon>
                            <href>http://maps.google.com/mapfiles/kml/shapes/info_circle.png</href>
                        </Icon>
                    </IconStyle>
                    
                </Style>
                <Style id="nolocation">
                    <IconStyle>
                        <Icon>
                            <href>http://maps.google.com/mapfiles/kml/shapes/donut.png</href>
                        </Icon>
                    </IconStyle>
                </Style>
                <Folder>
                    <xsl:apply-templates/>
                </Folder>
            </Document>
        </kml>
    </xsl:template>

    <xsl:template match="/table/tuple">
        <!--The different elements as variables, this makes the logic below easier to read-->
        <xsl:variable name="cat_summary" select="atom[@name='SummaryData']" />
        <xsl:variable name="regno" select="concat(atom[@name='CatPrefix'],atom[@name='CatRegNumber'],atom[@name='CatSuffix'])" />
        
        <xsl:variable name="lat" select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLatDec']"/>
        <xsl:variable name="long" select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLongDec']" />
        <xsl:variable name="location_summary" select="tuple[@name='BioEventRef']/atom[@name='SummaryData']" />
        <xsl:variable name="address" select="concat(tuple[@name='BioEventRef']/atom[@name='LocCountry'],', ',tuple[@name='BioEevntRef']/atom[@name='LocProvinceStateTerritory'],', ',tuple[@name='BioEevntRef']/atom[@name='LocNearestNamedPlace'],', ',tuple[@name='BioEevntRef']/atom[@name='LocPreciseLocation'])" />
        
        <Placemark>
            <name>
                <xsl:value-of select="$regno"/>
            </name>
            <description>
                <table >
                    <tr>
                        <td>
                            <xsl:value-of select="$cat_summary"/>
                        </td>
                    </tr>
                </table>
            </description>
            <snippet>
                <xsl:value-of select="$cat_summary"/>
            </snippet>
            <xsl:choose>
                <xsl:when test="$lat!='' and $long!=''">
                    <styleUrl>#default</styleUrl>
                </xsl:when>
                <xsl:when test="$lat='' and $long='' and  $location_summary!=''">
                    <styleUrl>#nocoords</styleUrl>
                </xsl:when>
                <xsl:otherwise>
                    <styleUrl>#nolocation</styleUrl>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$lat!=''">
                <Point>
                    <coordinates>
                        <xsl:value-of select="$long"/>,<xsl:value-of select="$lat"/>
                    </coordinates>
                </Point>
            </xsl:if>
            <address>
                <xsl:value-of select="$address" />
            </address>
        </Placemark>
    </xsl:template>

</xsl:stylesheet>