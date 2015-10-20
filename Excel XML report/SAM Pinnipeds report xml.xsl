<?xml version="1.0"?>

<xsl:stylesheet 
    version="1.0"
    xmlns="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
    > 
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>
    <xsl:template match="/">
        <xsl:processing-instruction name="mso-application">
            <xsl:text>progid="Excel.Sheet"</xsl:text>
        </xsl:processing-instruction>
        <Workbook 
        xmlns="urn:schemas-microsoft-com:office:spreadsheet"
        xmlns:o="urn:schemas-microsoft-com:office:office"
        xmlns:x="urn:schemas-microsoft-com:office:excel"
        xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
        xmlns:html="http://www.w3.org/TR/REC-html40"
        >
            <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office" />
            <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
                <AllowPNG/>
            </OfficeDocumentSettings>
            <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
                <WindowHeight>8265</WindowHeight>
                <WindowWidth>23400</WindowWidth>
                <WindowTopX>0</WindowTopX>
                <WindowTopY>0</WindowTopY>
                <ProtectStructure>False</ProtectStructure>
                <ProtectWindows>False</ProtectWindows>
            </ExcelWorkbook>
            <xsl:apply-templates/>
        </Workbook>
    </xsl:template>

    <xsl:template match="/*">
        <Worksheet ss:Name="SAM Pinnipeds Report">

            <Table >
                <!-- -->
                <!--headers for the excel sheet-->
                <Row>
                    <Cell>
                        <Data ss:Type="String">Prefix</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Reg Number</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Suffix</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Preceding Numbers</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Other Numbers</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Date Catalogued</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Catalogued by</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Form of Object</Data>
                    </Cell>          
                    <Cell>
                        <Data ss:Type="String">Kind of Object</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Family</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Genus</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Species</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Subspecies</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Type Status</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">ID Confidence</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Identified By</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Date Identified</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">ID Comments</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">ID Current</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Date Collected</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Origin Of Specimen</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Age Of Material</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Collectors</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Expedition Name</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Site Code</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Latitude DMS</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Latitude Dec</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Longitude DMS</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Longitude Dec</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Precision</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Determination</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Datum</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Other Datum</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Location</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Nearest Named Place</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Province/State/Territory</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Country</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Special Geographic Unit</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Method of Capture</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Tissues Collected</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">ABTC Number</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Preservative</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Fixative</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">How Acquired</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Acquisition Date</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Name of Source</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Current Location</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Permanent Location</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Age</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Sex</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Reproductive Condition</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Weight</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Measurement Unit</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Age/Weight Comments</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Standard Length</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Total Length</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Foreflipper Length</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Hindflipper Length</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Girth</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Measurement Unit</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Habitat</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Notes</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Itemised Notes</Data>
                    </Cell>

                </Row>
                <xsl:apply-templates />
            </Table>
        </Worksheet>
    </xsl:template>


    <xsl:template match="/table/tuple" >
        <Row>
            <!--If using the templates in the report documentation put the value template calls here-->
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatPrefix']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatRegNumber']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatSuffix']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='AcqPrecedingNumbers']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:call-template name="table">
                        <!-- Expand the XPATH as required to get to the required node -->
                        <xsl:with-param name="tablename" select="table[@name='OtherNumbers']" />
                    </xsl:call-template>
                </Data>
            </Cell> 
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatDateCatalogued']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='CatCataloguedByRef']/atom[@name='SummaryData']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatObjectForm']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatObjectType']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentFamilyLocal']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentGenusLocal']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentSpeciesLocal']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentSubspeciesLocal']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:call-template name="table">
                        <!-- Expand the XPATH as required to get to the required node -->
                        <xsl:with-param name="tablename" select="table[@name='TypeStatus']" />
                    </xsl:call-template>
                </Data>
            </Cell> 
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentConfidence']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentIdentifiedByLocal']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentDateIdentified']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentComments']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='IdeCurrentCurrent']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='PreDateCollected']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='LocOriginOfSpecimen']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamAgeOfMaterial']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='LocCollectorsLocal_tab']" />
                </Data>
            </Cell>    
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='ExpExpeditionName']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='ColCollectionEventCode']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLatitude']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLatDec']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLongitude']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLongDec']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatPreferredRadiusVerbatim']" />
                </Data>
            </Cell>      
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatLatLongDetermination_tab']" />
                </Data>
            </Cell>      
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatDatum_tab']" />
                </Data>
            </Cell>      
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='MapOtherDatum_tab']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocPreciseLocation']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocNearestNamedPlace']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocProvinceStateTerritory']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocCountry']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocSpecialGeographicUnit']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamMethodOfCapture']" />
                </Data>
            </Cell>      
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='BioTissueType']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioTissueRecordRef']/atom[@name='SummaryData']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='ZooPreservative']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='ZooFixative']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='AcqHowAcquired']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='AcqAcquisitionDate']" />
                </Data>
            </Cell>            
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='AcqNameSourceLocal_tab']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='SummaryData']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamMammalAge']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamSex']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamReproductiveCondition']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='BirWeight']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamMammalWeightUnit']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamWeightAgeComments']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamSL']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamTL']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamFore']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamHind']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamGirth']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='MamSealUnit']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='AquHabitatDescription']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='NotNotes']" />
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:call-template name="table">
                        <!-- Expand the XPATH as required to get to the required node -->
                        <xsl:with-param name="tablename" select="table[@name='Notes2']" />
                    </xsl:call-template>
                </Data>
            </Cell>  
        </Row>
    </xsl:template>


    <xsl:template name="table">
        <!-- This template causes the display of multiple table entries in a single cell 
         This allows reporting of, for example, Other Numbers -->
        <xsl:param name="tablename" />
        <xsl:for-each select="$tablename/tuple">
            <xsl:for-each select="atom">
                <xsl:choose>
                    <xsl:when test="position()!=last()">
                        <xsl:if test="not(. = '')">
                            <xsl:value-of select="concat(., ' ')" />
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="." />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>



</xsl:stylesheet>