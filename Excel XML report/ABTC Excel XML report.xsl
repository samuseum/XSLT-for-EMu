<?xml version="1.0"?>
<!--
This is an example of a more complicate Excel report that chooses the 
values that go in some columns based on the values in other columns
It also has a hidden second row that contains most of the EMu field names 
for the columns. This makes for quick and convenient update imports.

The ouput should be Saved as a normal excel file-->
<xsl:stylesheet 
        version="1.0"
        xmlns="urn:schemas-microsoft-com:office:spreadsheet"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
        > 
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>
    <xsl:template match="/">
        <!--This processing instruction is what causes the report to 'pop up' in Excel-->
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
            <Styles>
                <Style ss:ID="textwrap">
                    <Alignment ss:Vertical="Bottom" ss:WrapText="1"/>
                </Style>
            </Styles>
            <xsl:apply-templates/>
            <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
                <Selected/>
                <FreezePanes/>
                <FrozenNoSplit/>
                <SplitHorizontal>1</SplitHorizontal>
                <TopRowBottomPane>1</TopRowBottomPane>
                <ActivePane>2</ActivePane>
                <Panes>
                    <Pane>
                        <Number>3</Number>
                    </Pane>
                    <Pane>
                        <Number>2</Number>
                        <ActiveRow>6</ActiveRow>
                        <ActiveCol>6</ActiveCol>
                    </Pane>
                </Panes>
                <ProtectObjects>False</ProtectObjects>
                <ProtectScenarios>False</ProtectScenarios>
            </WorksheetOptions>
        </Workbook>
    </xsl:template>

    <xsl:template match="/*">
        <Worksheet ss:Name="ABTC report">
            <Table>
                <!-- there are 34 columns in the ABTC report-->
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
                        <Data ss:Type="String">Alcohol Number</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Frozen Number</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Freezer Project Number</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Tissue - Storage - Disposition</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Tissue Comments</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Other Numbers</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Category</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Phylum</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Class</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Order</Data>
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
                        <Data ss:Type="String">Date Collected</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Verbatim Date Collected</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Country</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">State</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Special Geographic Unit</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Nearest Named Place</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Precise Location</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Site Code</Data>
                    </Cell>       
                    <Cell>
                        <Data ss:Type="String">Expedition</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Latitude</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Longitude</Data>
                    </Cell> 
                    <Cell>
                        <Data ss:Type="String">Collector</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Donor</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Voucher Extant?</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Source Institution</Data>
                    </Cell>        
                    <Cell>
                        <Data ss:Type="String">Source Institution Code</Data>
                    </Cell>                     
                    <Cell>
                        <Data ss:Type="String">Source Collection Code</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Source Registration Number</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">Source Specimen Preservation Method</Data>
                    </Cell>  
                    <Cell>
                        <Data ss:Type="String">Embargoed?</Data>
                    </Cell>  
                    <Cell>
                        <Data ss:Type="String">Embargoed by</Data>
                    </Cell>  
                    <Cell>
                        <Data ss:Type="String">Embargoed Until</Data>
                    </Cell> 
                    <Cell>
                        <Data ss:Type="String">Catalogue record irn</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">Collection Event irn</Data>
                    </Cell>                    

                </Row>
                <Row ss:AutoFitHeight="0" ss:Hidden="1">
                    <Cell>
                        <Data ss:Type="String">CatPrefix</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">CatRegNumber</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">CatSuffix</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">TisAlcoholNumber</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">TisFrozenNumber</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">TisFreezerProjectNumber</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">TisTissue_tab - TisStorageMedium_tab - TisDisposition_tab (joined)</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">TisTissueComments</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">CatOtherNumbersValue_tab (joined)</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">SouCategory</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">ClaPhylum</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">ClaClass</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">ClaOrder</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">ClaFamily</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">ClaGenus</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">ClaSpecies</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">ClaSubspecies</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">PreDateCollected</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">PreVerbatimDateCollected</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">LocCountry</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">LocProvinceStateTerritory</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">LocSpecialGeographicUnit</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">LocNearestNamedPlace</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">LocPreciseLocation</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">ColCollectionEventCode</Data>
                    </Cell>       
                    <Cell>
                        <Data ss:Type="String">ExpExpeditionName</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">LatLatitudeDecimal_nesttab</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">LatLongitudeDecimal_nesttab</Data>
                    </Cell> 
                    <Cell>
                        <Data ss:Type="String">LocCollectorsRef_tab.SummaryData</Data>
                    </Cell>  
                    <Cell>
                        <Data ss:Type="String">AcqNameSourceRef_tab.SummaryData</Data>
                    </Cell>  
                    <Cell>
                        <Data ss:Type="String">SouVoucherExtant</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">SouSourceInstitutionRef.SummaryData</Data>
                    </Cell>        
                    <Cell>
                        <Data ss:Type="String">SouInstitutionCode</Data>
                    </Cell>                     
                    <Cell>
                        <Data ss:Type="String">SouCollectionCode</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">SouRegistrationNumber</Data>
                    </Cell>                    
                    <Cell>
                        <Data ss:Type="String">TisInitalPreservationMethod</Data>
                    </Cell>            
                    <Cell>
                        <Data ss:Type="String">TisSampleEmbargoed</Data>
                    </Cell>   
                    <Cell>
                        <Data ss:Type="String">TisEmbargoedByRef.SummaryData</Data>
                    </Cell> 
                    <Cell>
                        <Data ss:Type="String">TisEmbargoedUntilDate</Data>
                    </Cell>   
                    <Cell>
                        <Data ss:Type="String">(Catalogue record)irn</Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">(Collection Event) irn</Data>
                    </Cell>                    
                    
                </Row>
                <xsl:apply-templates mode="data"/>
            </Table>
        </Worksheet>
    </xsl:template>





    <xsl:template match="/table/tuple" mode="data">
        <Row ss:AutoFitHeight="0" ss:Height="14">
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatPrefix']"/>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatRegNumber']"/>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='CatSuffix']"/>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='TisAlcoholNumber']"/>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='TisFrozenNumber']"/>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='TisFreezerProjectNumber']"/>
                </Data>
            </Cell>
            <Cell ss:StyleID="textwrap">
                <Data ss:Type="String">
                    <xsl:call-template name="table">
                        <xsl:with-param name="tablename" select="table[@name='Tissue']"/>
                    </xsl:call-template>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='TisTissueComments']"/>
                </Data>
            </Cell>
            <Cell ss:StyleID="textwrap">
                <Data ss:Type="String">
                    <xsl:call-template name="table">
                        <xsl:with-param name="tablename" select="table[@name='OtherNumbers']"/>
                        <!--The other numbers table currently just returns the values. If the kind and source
                        are also required add those fields to the report and they'll be added to the field-->
                    </xsl:call-template>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='SouCategory']"/>
                </Data>
            </Cell>
            <xsl:choose>
                <xsl:when test="atom[@name='IdeAcceptedSummaryDataLocal']!=''">
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='IdeAcceptedRef']/atom[@name='ClaPhylum']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='IdeAcceptedRef']/atom[@name='ClaClass']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='IdeAcceptedRef']/atom[@name='ClaOrder']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='IdeAcceptedRef']/atom[@name='ClaFamily']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='IdeAcceptedRef']/atom[@name='ClaGenus']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='IdeAcceptedRef']/atom[@name='ClaSpecies']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='IdeAcceptedRef']/atom[@name='ClaSubspecies']"/>
                        </Data>
                    </Cell>
                </xsl:when>
                <xsl:otherwise>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='IdeCurrentPhylumLocal']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='IdeCurrentClassLocal']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='IdeCurrentOrderLocal']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='IdeCurrentFamilyLocal']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='IdeCurrentGenusLocal']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='IdeCurrentSpeciesLocal']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='IdeCurrentSubspeciesLocal']"/>
                        </Data>
                    </Cell>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="tuple[@name='SouVoucherHeldRef']!=''">
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/atom[@name='PreDateCollected']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/atom[@name='PreVerbatimDateCollected']"/>
                        </Data>
                    </Cell> 
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='LocCountry']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='LocProvinceStateTerritory']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='LocSpecialGeographicUnit']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='LocNearestNamedPlace']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='LocPreciseLocation']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='ColCollectionEventCode']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='ExpExpeditionName']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLatDec']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLongDec']"/>
                        </Data>
                    </Cell>

                    <Cell>
                        <Data ss:Type="String">
                            <xsl:call-template name="table">
                                <xsl:with-param name="tablename" select="tuple[@name='SouVoucherHeldRef']/table[@name='LocCollectorsRef_tab']"/>
                            </xsl:call-template>
                        </Data>
                    </Cell>  
                </xsl:when>
                <xsl:otherwise>

                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='PreDateCollected']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='PreVerbatimDateCollected']"/>
                        </Data>
                    </Cell> 
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocCountry']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocProvinceStateTerritory']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocSpecialGeographicUnit']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocNearestNamedPlace']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LocPreciseLocation']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='ColCollectionEventCode']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='ExpExpeditionName']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLatDec']"/>
                        </Data>
                    </Cell>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLongDec']"/>
                        </Data>
                    </Cell>

                    <Cell ss:StyleID="textwrap">
                        <Data ss:Type="String">
                            <xsl:call-template name="table">
                                <xsl:with-param name="tablename" select="table[@name='LocCollectorsRef_tab']"/>
                            </xsl:call-template>
                        </Data>
                    </Cell>

                </xsl:otherwise>
            </xsl:choose>
            <Cell ss:StyleID="textwrap">
                <Data ss:Type="String">
                    <xsl:call-template name="table">
                        <xsl:with-param name="tablename" select="table[@name='AcqNameSourceRef_tab']"/>
                    </xsl:call-template>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='SouVoucherExtant']"/>
                </Data>
            </Cell>

            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='SouSourceInstitutionRef']/atom[@name='SummaryData']"/>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='SouInstitutionCode']"/>
                </Data>
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='SouCollectionCode']"/>
                </Data>
            </Cell>
            <xsl:choose>
                <xsl:when test="tuple[@name='SouVoucherHeldRef']!='' and atom[@name='SouRegistrationNumber']=''">
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="concat(tuple[@name='SouVoucherHeldRef']/atom[@name='CatPrefix'], tuple[@name='SouVoucherHeldRef']/atom[@name='CatRegNumber'], tuple[@name='SouVoucherHeldRef']/atom[@name='CatSuffix'])"/>
                        </Data>
                    </Cell>
                </xsl:when>
                <xsl:otherwise>
                    <Cell>
                        <Data ss:Type="String">
                            <xsl:value-of select="atom[@name='SouRegistrationNumber']"/>
                        </Data>
                    </Cell> 
                </xsl:otherwise>
            </xsl:choose>
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='TisInitalPreservationMethod']"/>
                </Data>
            </Cell>   
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='TisSampleEmbargoed']"/>
                </Data>
            </Cell> 
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="tuple[@name='TisEmbargoedByRef']/atom[@name='SummaryData']"/>
                </Data>
            </Cell> 
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='TisEmbargoedUntilDate']"/>
                </Data>
            </Cell> 
            <Cell>
                <Data ss:Type="String">
                    <xsl:value-of select="atom[@name='irn']"/>
                </Data>    
            </Cell>
            <Cell>
                <Data ss:Type="String">
                    <xsl:choose>
                     <xsl:when test="tuple[@name='SouVoucherHeldRef']!=''">
                         <xsl:value-of select="concat(tuple[@name='SouVoucherHeldRef']/tuple[@name='BioEventRef']/atom[@name='irn'], ' (from source specimen)')"/>
                     </xsl:when>
                     <xsl:otherwise>
                         <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name='irn']" />
                     </xsl:otherwise>
                    </xsl:choose>
                </Data>    
            </Cell>                    

        </Row>
    </xsl:template>

    <xsl:template name="table">
        <xsl:param name="tablename"/>
        <xsl:for-each select="$tablename/tuple">
            <xsl:for-each select="atom">
                <xsl:choose>
                    <xsl:when test="position()!=last()">
                        <xsl:if test="not(. = '')">
                            <xsl:value-of select="concat(., ' ')"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="position()!=last()">
                <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>



</xsl:stylesheet>
