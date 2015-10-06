<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:emu="http://kesoftware.com/emu">
    <xsl:output method="html" encoding="ISO-8859-1"/>

    <xsl:template match="/table/tuple">
        <!--Variables for all the data from the report. Add a variable for each field from the report
        Having the values separated out into variables here makes the logic easier to understand-->
        
        <xsl:variable name="summarydata" select="atom[@name='SummaryData']" />
        
        <!--registration details-->
        <xsl:variable name="registration_number" >
            <xsl:value-of select="concat(atom[@name='CatPrefix'],atom[@name='CatRegNumber'])"/>
            <xsl:if test="atom[@name='CatSuffix']!=''">
                <xsl:value-of select="concat('.',atom[@name='CatSuffix'])"/>
            </xsl:if>
        </xsl:variable>
        
        <!--multimedia (the first image)-->
        <xsl:variable name="multimedia" select="table[@name='MulMultiMediaRef_tab']/tuple[1]/atom[@name = 'Multimedia']" />
        <!--identification, chosen from the accepted identification if one has been chosen otherwise the most recent identification-->        
        <xsl:variable name="identification" select="table[@name='IdeTaxonRef_tab']/tuple[1]/atom[@name='SummaryData']" />

        <!--collection information-->
        <xsl:variable name="latitude" select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLatDec']" />
        <xsl:variable name="longitude" select="tuple[@name='BioEventRef']/atom[@name='LatPreferredCentroidLongDec']" />
        <xsl:variable name="coordinate_uncertainty" select="tuple[@name = 'BioEventRef']/table[@name = 'LatRadiusNumeric_tab']/tuple[1]/atom[@name = 'LatRadiusNumeric']" />
        <xsl:variable name="collection_summary" select="tuple[@name='BioEventRef']/atom[@name='SummaryData']" />
        <xsl:variable name="date_collected" select="atom[@name='PreDateCollected']"/>
        <xsl:variable name="date_from" select="tuple[@name='BioEventRef']/atom[@name='ColDateVisitedFrom']" />
        <xsl:variable name="date_to" select="tuple[@name='BioEventRef']/atom[@name='ColDateVisitedTo']" />
    
        <html>
            <head>
                <script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3"/>
                <xsl:call-template name="styles"/>
                <xsl:call-template name="scripts"/>
            </head>
            <body class="sheet" onLoad="loaded()">
                    <div id="header">
                        <div id="summarydata">
                            <xsl:value-of select="$summarydata"/>
                        </div>
                    </div>
                    <div id="images">
                        <xsl:if test="$multimedia != ''">
                            <img class="multimediaimage">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat('file:///', translate($multimedia, '\', '/'))" /> 
                                </xsl:attribute>
                            </img>
                        </xsl:if>
                        <xsl:if test="$latitude != ''">
                            <div id="map">
                                <xsl:choose>
                                    <xsl:when test="$coordinate_uncertainty != ''">
                                        <script type="text/javascript"> LoadMap("map",<xsl:value-of select="$latitude"/>, <xsl:value-of select="$longitude"/>,<xsl:value-of select="$coordinate_uncertainty"/>);</script>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <script type="text/javascript"> LoadMap("map",<xsl:value-of select="$latitude"/>, <xsl:value-of select="$longitude"/>);</script>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                            </div>
                        </xsl:if>
                    </div>
                    <div id="data">
                        <!--Add a table row for each value that you want to appear-->
                   <table>
                       <tr>
                           <td class="prompt">Registration Number</td>
                           <td class="value">
                               <xsl:value-of select="$registration_number" />
                           </td>
                       </tr>
                       <tr>
                           <td class="prompt">Identification</td>
                           <td class="value">
                               <xsl:value-of select="$identification" />
                           </td>
                       </tr>
                       <tr>
                           <td class="prompt">Collection location</td>
                           <td class="value">
                               <xsl:value-of select="$collection_summary"/>
                           </td>
                       </tr>
                       <tr>
                           <td class="prompt">Collection Date</td>
                           <td class="value">
                               <xsl:choose>
                                   <xsl:when test="$date_collected!=''">
                                       <xsl:value-of select="$date_collected"/>
                                   </xsl:when>
                                   <xsl:when test="$date_from!='' and $date_to!='' and $date_from!=$date_to">
                                       <xsl:value-of select="concat($date_from,'-',$date_to)"/>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:value-of select="$date_from"/>
                                   </xsl:otherwise>
                               </xsl:choose>
                           </td>
                       </tr>
                      </table>
                    </div>
                    
                
                    <div id="footer">
                        <xsl:value-of select="atom[@name = 'irn']"/>
                    </div>
                    
            </body>
        </html>
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
.multimediaimage{
        width:250px; 
        float:right;
        border-width: 2px;
        border-style: solid;
        border-color: #c41230;
        margin: 1em;
}
#footer {
    font-size: 0.75em;
    left: 2em;    
    width: 80%;
    }
#storagelocation 
{
    width: 80%;
}

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
img.specimen
{
    width: 250px;
    height: auto;
}
td.icon
{
    width: 0px;
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
td.prompt
{
    width: 200px;
    font-weight: bold;
    font-size: smaller;
    vertical-align: top;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.value
{
    font-size: smaller;
    padding-left: 0.5em;
    padding-right: 0.5em;
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
        <script type="text/javascript">
            <xsl:text>
        function LoadMap(div_map, latitude, longitude,uncertainty) {

            var myLatLng = new google.maps.LatLng(latitude,longitude);

            var mapOptions = {    zoom: 7,  center: myLatLng,
                  panControl: false,
                  zoomControl: true,
                  mapTypeControl: true,
                  scaleControl: true,
                  streetViewControl: false,
                  overviewMapControl: false
                  }

            var map = new google.maps.Map (document.getElementById(div_map), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                title:"specimen"
                });

            // Add circle overlay and bind to marker for coordinate uncertainty in metres i.e. Radius(numeric)
            var circle = new google.maps.Circle({
                map: map,
                radius: uncertainty,
                fillOpacity: 0.25,
                fillColor: "#797979",
                strokeWeight: 0.5
                });
                circle.bindTo("center", marker, "position");
    }

            </xsl:text>
        </script>
    </xsl:template>
   

</xsl:stylesheet>
