<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:emu="http://kesoftware.com/emu">
    <xsl:output method="html" encoding="UTF-8" />

    <!--Lookup Table for prompts
    Add or delete fields to match those selected at Stage 1-->

    <emu:column name="SummaryData" show="no" />
    <emu:column name="ColDateVisitedFrom">Date Visited From</emu:column>    
    <emu:column name="ColDateVisitedTo">Date Visited To</emu:column>   
    <emu:column name="SigDateSighted">Date of Sighting</emu:column>        
    <emu:column name="ColCollectionEventCode">Site Code</emu:column>
    <emu:column name="LocPreciseLocation">Precise Location</emu:column>
    <emu:column name="LocNearestNamedPlace">Nearest Named Place</emu:column>
    <emu:column name="LocSpecialGeographicUnit">Special Geographic Unit</emu:column> 
    <emu:column name="LocProvinceStateTerritory">State</emu:column>
    <emu:column name="LocCountry">Country</emu:column>
    <emu:column name="LocOcean">Ocean</emu:column>
    <emu:column name="AquVesselName">Vessel Name</emu:column>
    <emu:column name="AquVesselType">Vessel Type</emu:column>
    <emu:column name="AquCruiseNumber">Cruise Number</emu:column>    
    <emu:column name="EraDepthFromMt">Depth From</emu:column>    
    <emu:column name="EraDepthToMt">Depth To</emu:column>    
    <emu:column name="TerElevationFromMet">Elevation From</emu:column>    
    <emu:column name="TerElevationToMet">Elevation To</emu:column>    
    <emu:column name="coordinates" show="no" />
    <emu:column name="LatRadiusNumeric_tab">Coordinate Uncertainty in Metres</emu:column> 
    <emu:column name="LatRadiusVerbatim">Precision</emu:column>    
    <emu:column name="MulMultiMediaRef_tab" show = "no" />

    <!--It is not necessary to make changes to the rest of this file. However it is possible to change the format and look of the stylesheet through appropriate modifications -->
    <!--The root transformation -->

    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"
   integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
   crossorigin=""/>
 <script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"
   integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA=="
   crossorigin=""></script>
                <xsl:call-template name="styles" />
                <xsl:call-template name="scripts" />
            </head>
            <body class="sheet" onLoad="loaded()">
                <xsl:call-template name="body" />
            </body>
        </html>
    </xsl:template>
    <!--
            Body template
     -->
    <xsl:template name="body">
        <xsl:for-each select="/table/tuple">
            <xsl:call-template name="record" />
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!--
           CSS styles template
     -->
    <xsl:template name="styles">
        <style type="text/css">
            <xsl:text>


                #images {
                width:95%;
                padding-top: 0.5em;
                padding-bottom: 0.5em;
                padding-left: 0.5em;
                padding-right: 0.5em;
                overflow:hidden;
                margin: 0.5em;
                }

                #map
                {
                width:250px; 
                height:250px; 
                display:block;
                float: left;
                border-width: 2px;
                border-style: solid;
                border-color: #c41230;
                margin: 1em;
                }   

                .picture {float:right;}

                body.sheet
                {
                font-family: Arial;
                }
                table.sheet
                {
                width: 95%;
                border-width: 2px;
                border-style: solid;
                border-collapse: collapse;
                background-color: #EEEEEE;
                border-color: #0E6CA5;
                }

                #header
                {
                background-color: #0E6CA5;
                color: #FFFFFF;
                font-weight: bold;
                padding-top: 0.5em;
                padding-bottom: 0.5em;
                padding-left: 0.5em;
                padding-right: 0.5em;
                }
                table.picture
                {
                width: 20%;
                }
                table.icon
                {
                border-width: 2px;
                border-style: solid;
                border-color: #c41230;
                }
                img.icon
                {
                width: 250px;
                height: auto;
                }
                td.icon
                {
                width: 0px;
                }

                #reportedvalues
                {
                width: 80%;
                float:left;
                }
                tr.values
                {
                width: 100%;
                }

                table.data
                {
                width: 100%;
                }
                td.title
                {
                color: #32731e;
                font-weight: bold;
                text-align: center;
                width: 100%;
                padding-top: 2em;
                padding-bottom: 2em;
                padding-left: 0.5em;
                padding-right: 0.5em;
                }
                td.atomprompt
                {
                width: 200px;
                font-weight: bold;
                font-size: smaller;
                vertical-align: top;
                padding-left: 0.5em;
                padding-right: 0.5em;
                }
                td.atomvalue
                {
                font-size: smaller;
                padding-left: 0.5em;
                padding-right: 0.5em;
                }

                td.tableprompt
                {
                width: 160px;
                font-weight: bold;
                font-size: smaller;
                vertical-align: top;
                padding-left: 0.5em;
                padding-right: 0.5em;
                }
                td.tablevalue
                {

                font-size: smaller;
                padding-left: 0.5em;
                padding-right: 0.5em;
                }


                table.nesttab
                {

                border-width: 1px;
                border-style: solid;
                border-color: #c49ca3;
                border-collapse: collapse

                }

                tr.nesttab
                {

                width: 160px;
                border-width: 1px;
                border-style: solid;
                border-color: #c49ca3;
                padding-left: 0.5em;
                padding-right: 0.5em;
                }

                td.nesttab
                {

                font-size: smaller;
                padding-left: 0.5em;
                padding-right: 0.5em;
                border-width: 1px;
                border-style: solid;
                border-color: #c49ca3;
                }

                td.nesthead
                {

                width: 160px;
                font-weight: bold;
                font-size: smaller;
                vertical-align: top;
                padding-left: 0.5em;
                padding-right: 0.5em;
                border-color: #c49ca3;
                border-width: 1px;
                border-style: solid;

                }


            </xsl:text>
        </style>
    </xsl:template>
    <!--
            Scripts template
     -->
    <xsl:template name="scripts">

        <script type="text/javascript">
            <xsl:text>
                function loaded()
                {
                var tables = document.getElementsByTagName("table");

                for (var index = 0; index &lt; tables.length; index++)
                {
                if (tables[index].id == "datatable")
                for (var row = 0; row &lt; tables[index].rows.length; row++)
                if (row % 2 == 0)
                tables[index].rows[row].bgColor = "#FFFFFF";
                }
                }
            </xsl:text>
        </script>
 
     </xsl:template>
    <!--
            Record template
     -->
    <xsl:template name="record">
        <div id="header">
            <xsl:call-template name="heading" />
        </div>
        <div id="images">
            <xsl:call-template name="image" />
            <xsl:if test="//atom[@name='LatPreferredCentroidLatDec']!=''" >
                <xsl:call-template name="map" />    
            </xsl:if>
        </div>
        <div id="reportedvalues">
            <xsl:call-template name="data" />
        </div>
    </xsl:template>
    <!--
            Heading template
     -->
    <xsl:template name="heading">
        <tr class="heading">
            <td class="heading">
                <xsl:value-of select="atom[@name='SummaryData']" />
            </td>
        </tr>
    </xsl:template>


    <xsl:template name="image">
        <xsl:if test="table/tuple/atom[@name='Multimedia']" >
            <img class="multimediaimage">
                <xsl:attribute name="src">
                    <xsl:value-of select="concat('file:///', translate(table/tuple/atom[@name='Multimedia'], '\', '/'))" />
                </xsl:attribute>
            </img>
        </xsl:if>
    </xsl:template>
    <!--
        Map template
    -->
    <xsl:template name="map">
      <div id="map" >
        <xsl:choose>
          <xsl:when test="//atom[@name='LatRadiusNumeric']!=''" >
            <script type="text/javascript">
              var map = L.map('map').setView([<xsl:value-of select="//atom[@name='LatPreferredCentroidLatDec']"/>, <xsl:value-of select="//atom[@name='LatPreferredCentroidLongDec']"/>], 13);

              L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
              attribution: '&amp;copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
              }).addTo(map);

              L.marker([<xsl:value-of select="//atom[@name='LatPreferredCentroidLatDec']"/>, <xsl:value-of select="//atom[@name='LatPreferredCentroidLongDec']"/>]).addTo(map)

              var circle = L.circle([<xsl:value-of select="//atom[@name='LatPreferredCentroidLatDec']"/>, <xsl:value-of select="//atom[@name='LatPreferredCentroidLongDec']"/>], {
              color: 'grey',
              fillColor: 'light-grey',
              follOpacity: 0.5,
              radius: <xsl:value-of select="//atom[@name='LatRadiusNumeric']"/>
              }).addTo(map);
              
            </script>
          </xsl:when>
                <xsl:otherwise>
                  <script type="text/javascript">
                    var map = L.map('map').setView([<xsl:value-of select="//atom[@name='LatPreferredCentroidLatDec']"/>, <xsl:value-of select="//atom[@name='LatPreferredCentroidLongDec']"/>], 13);

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&amp;copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    }).addTo(map);

                    L.marker([<xsl:value-of select="//atom[@name='LatPreferredCentroidLatDec']"/>, <xsl:value-of select="//atom[@name='LatPreferredCentroidLongDec']"/>]).addTo(map)
                  </script>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>
    <!--
            Data template
     -->
    <xsl:template name="data">
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <xsl:apply-templates select="*" />
                </table>
            </td>
        </tr>
    </xsl:template>
    <!--
            Atom template
     -->
    <xsl:template match="atom">
        <xsl:variable name="column" select="document('')/*/emu:column[@name=current()/@name]" />
        <xsl:if test="not($column/@show = 'no') and ($column/@showempty = 'yes' or text())">
            <tr class="atomvalue">
                <td class="atomprompt">
                    <xsl:call-template name="prompt">
                        <xsl:with-param name="column" select="$column" />
                    </xsl:call-template>
                </td>
                <td class="atomvalue">
                    <xsl:value-of select="." />
                </td>
            </tr>
        </xsl:if>
    </xsl:template>
    <!--
            Table template
     -->
    <xsl:template match="table">
        <xsl:variable name="column" select="document('')/*/emu:column[@name=current()/@name]" />
        <xsl:if test="not($column/@show = 'no') and ($column/@showempty = 'yes' or count(child::node()) != 0)">
            <tr class="tablevalue">
                <td class="tableprompt">
                    <xsl:call-template name="prompt">
                        <xsl:with-param name="column" select="$column" />
                    </xsl:call-template>
                </td>
                <td class="tablevalue">
                    <xsl:for-each select="tuple/atom">
                        <xsl:value-of select="." />
                        <br />
                    </xsl:for-each>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>
    <!--
            Nested Table template
     -->
    <xsl:template match="*[contains(@name,'_nesttab')]">
        <xsl:variable name="column" select="document('')/*/emu:column[@name=current()/@name]" />
        <xsl:if test="not($column/@show = 'no') and ($column/@showempty = 'yes' or count(child::node()) != 0)">
            <xsl:for-each select=".//*[contains(@name,'_nesttab')]">
                <tr class="tablevalue">
                    <td class="tableprompt">
                        <xsl:call-template name="prompt">
                            <xsl:with-param name="column" select="$column" />
                        </xsl:call-template>
                    </td>
                    <td class="tablevalue">
                        <xsl:for-each select="tuple/atom">
                            <xsl:value-of select="." />
                            <br />
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    <!--
            Prompt template
     -->
    <xsl:template name="prompt">
        <xsl:param name="column" />
        <xsl:choose>
            <xsl:when test="$column/text()">
                <xsl:value-of select="$column/text()" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@name" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
