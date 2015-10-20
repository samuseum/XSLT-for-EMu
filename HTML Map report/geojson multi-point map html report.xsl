<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:emu="http://kesoftware.com/emu">
<xsl:output method="html" encoding="ISO-8859-1" />

<xsl:template match="/">
    <html>
        <head>
            <script src="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.js"/>
            <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"/>
            <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css"/>
            <link rel="stylesheet" href="http://leaflet.github.io/Leaflet.markercluster/dist/MarkerCluster.css"/>
            <script src="http://leaflet.github.io/Leaflet.markercluster/dist/leaflet.markercluster.js"/>
            <xsl:call-template name="styles"/>
            <xsl:call-template name="scripts"/>
            <link rel="shortcut icon"
                href="http://www.samuseum.sa.gov.au/Content/images/favicon.png"/>
        </head>
        <body class="sheet">
            <div id="header">
                <h1>South Australian Museum</h1>
            </div>
            <br/>
            <div id="map"/>
            <br/>
            <div id="tables">
                <table id="coords_table">
                    <caption/>
                    <thead/>
                    <tbody/>
                </table>
                <table id="no_coords_table">
                    <caption/>
                    <thead/>
                    <tbody/>
                </table>
            </div>
            <script type="text/javascript">drawMapAndTable()</script>
            <div id="footer">
                <div id="brand" title="South Australian Museum" href="/"/>
            </div>
        </body>
    </html>
</xsl:template>

<xsl:template name="styles">
    <style type="text/css">

        <xsl:text>
            p,td,th,caption{font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            fontsize:12px;}

            #brand
            {
            background: url('http://www.samuseum.sa.gov.au/Upload/SAmuseumGovLogo_1.png') no-repeat scroll 20px 10px transparent;
            height: 70px;
            padding: 0px;
            }

            #footer
            {                 
            font-family: "Freight Sans","Lato",Arial,sans-serif;
            font-style: normal;
            font-weight: normal;
            background-color: #4D4B48;
            color: #FFFFFF;
            letter-spacing: 0px;
            font-size: 14px;
            width: 100%;

            padding-top: 0.2em;
            padding-bottom: 0.2em;
            padding-left: 0.5em;
            padding-right: 0.5em;
            }

            #header {
            font-family: "Freight Sans","Lato",Arial,sans-serif;
            font-style: normal;
            font-weight: normal;
            color: #4D4B48;
            letter-spacing: 0px;
            font-size: 16px;
            background-color: #4D4B48;
            color: #FFFFFF;
            padding-top: 0.2em;
            padding-bottom: 0.2em;
            padding-left: 0.5em;
            padding-right: 0.5em;
            }
            .datatable
            {
            background: #fff;
            margin: 45px;
            width: 80%;
            border-collapse: collapse;
            text-align: left;
            }
            caption
            {
            font-size: 18px;
            font-weight: normal;
            color: #000;
            padding: 20px 8px;
            border-bottom: 2px solid #6678b1;
            }
            th
            {
            font-size: 14px;
            font-weight: normal;
            color: #4D4B48;
            padding: 10px 8px;
            border-bottom: 2px solid #6678b1;
            }

            tr{font-size: 12px;
            border-bottom: 1px solid #ccc;
            color: #4D4B48;

            padding: 6px 8px;}

            td
            {

            }
            tbody tr:hover td
            {
            color: #000;
            background-color: #E0E0E0  
            }

            #images {
            width:95%;
            padding-top: 0.5em;
            padding-bottom: 0.5em;
            padding-left: 0.5em;
            padding-right: 0.5em;
            overflow:hidden;
            margin: 0.5em;
            }

            <!--
      map styles for Leaflet
 -->        

            #map { 
            align:center;
            vertical-align: middle;
            height: 600px;
            width: 935px;
            border: 2px solid;
            }

            <!--
      map styles for Leaflet MarkerCluster
 -->             
            .marker-cluster-small div {
            background-color: rgba(110, 204, 57, 0.9);
            }
            .marker-cluster-medium div {
            background-color: rgba(240, 194, 12, 0.9);
            }
            .marker-cluster-large div {
            background-color: rgba(241, 128, 23, 0.9);
            }
            /* IE 6-8 fallback colors */
            .leaflet-oldie .marker-cluster-small {
            background-color: rgb(181, 226, 140);
            }
            .leaflet-oldie .marker-cluster-small div {
            background-color: rgb(110, 204, 57);
            }
            .leaflet-oldie .marker-cluster-medium {
            background-color: rgb(241, 211, 87);
            }
            .leaflet-oldie .marker-cluster-medium div {
            background-color: rgb(240, 194, 12);
            }
            .leaflet-oldie .marker-cluster-large {
            background-color: rgb(253, 156, 115);
            }
            .leaflet-oldie .marker-cluster-large div {
            background-color: rgb(241, 128, 23);
            }
            .marker-cluster {
            background-clip: padding-box;
            border-radius: 40px;
            }
            .marker-cluster div {
            width: 30px;
            height: 30px;
            margin-left: 5px;
            margin-top: 5px;
            text-align: center;
            border-radius: 15px;
            font: 12px "Helvetica Neue", Arial, Helvetica, sans-serif;
            }
            .marker-cluster span {
            line-height: 30px;
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
                var datapointsjson = { "type": "FeatureCollection",
                "features": [</xsl:text>

<xsl:apply-templates select="/table/tuple" />
    <xsl:text>]};</xsl:text>
    </script>


    <script type="text/javascript">
        function drawMapAndTable()
        {
        var map = new L.map('map');

        var markers = L.markerClusterGroup({maxClusterRadius: 30,
        singleMarkerMode: true});

        var myLayer = L.geoJson(datapointsjson,{onEachFeature: function (feature, layer) {
                                var caption = feature.properties.Regno+"<br />" + "I.D: "+feature.properties.Taxon+"<br />";

                                if(feature.properties.TypeStatus){
                                    caption += feature.properties.TypeStatus + "<br />";
                                }
                                
                                if(feature.properties.Sitecode){
                                    caption += "Site code: " + feature.properties.Sitecode + "<br />";
                                }

                                if(feature.properties.NearestNamedPlace){
                                    caption += "Nearest named place: " +feature.properties.NearestNamedPlace+"<br />";
                                }

                                if(feature.properties.PreciseLocation){
                                    caption += "Precise location: " +feature.properties.PreciseLocation+"<br />";
                                }

                                caption += "Coordinates: "+feature.geometry.coordinates+"<br />";

                                layer.bindPopup(caption
                                );
                                }
                            }
                        );



        var bounds = myLayer.getBounds();
        map.fitBounds(bounds, {padding:[10,10]});

        var svg = d3.select(map.getPanes().overlayPane).append("svg");

        var g = svg.append("g").attr("class", "leaflet-zoom-hide");

        function project(x) {
        var point = map.latLngToLayerPoint(new L.LatLng(x[1], x[0]));
        return [point.x, point.y];
        }

        var path = d3.geo.path().projection(project)
        .pointRadius(2.5);

        var feature = g.selectAll("path")
        .data(datapointsjson.features)
        .enter().append("path");

        map.on("viewreset", reset);
        
        reset();

        function reset() {
        var bounds = path.bounds(datapointsjson),
        topLeft = bounds[0],
        bottomRight = bounds[1];

        svg.attr("width", bottomRight[0] - topLeft[0])
            .attr("height", bottomRight[1] - topLeft[1])
            .style("margin-left", topLeft[0] + "px")
            .style("margin-top", topLeft[1] + "px");

        g.attr("transform", "translate(" + -topLeft[0] + "," + -topLeft[1] + ")");

        feature.attr("d", path);
        }

        var OpenStreetMap = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { attribution: 'Tiles &#169; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'}).addTo(map);

        var Esri_WorldImagery = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        attribution: 'Tiles &#169; Esri - Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
        });

        var GATopomap = L.tileLayer.wms('http://www.ga.gov.au/gisimg/services/topography/NATMAP_Digital_Maps_250K_2008Edition_WM/MapServer/WMSServer', {layers: 'Australia 250K Topographic Map', format: 'image/jpeg', attribution: 'Tiles &#169; Commonwealth of Australia (<a href="http://www.ga.gov.au/scientific-topics/geographic-information/topographic-maps-data/digital-topographic-maps">Geoscience Australia</a>) 2013. <a href="http://creativecommons.org/licenses/by/3.0/au/">CC BY 3.0 AU</a> .'});

        var Esri_NatGeoWorldMap = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}', {
        attribution: 'Tiles &#169; Esri - National Geographic, Esri, DeLorme, NAVTEQ, UNEP-WCMC, USGS, NASA, ESA, METI, NRCAN, GEBCO, NOAA, iPC',
        maxZoom: 16
        });

        var Esri_WorldGrayCanvas = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}', {
        attribution: 'Tiles &#169; Esri - Esri, DeLorme, NAVTEQ',
        maxZoom: 16
        });

        var baseMaps = {
        "OpenStreetMap": OpenStreetMap,
        "Geoscience Australia Topomap": GATopomap,
        "ESRI Satellite": Esri_WorldImagery,
        "ESRI NatGeoMap": Esri_NatGeoWorldMap,
        "ESRI Gray Canvas": Esri_WorldGrayCanvas,
        }

        var IBRA_bioregions = L.tileLayer.wms('http://spatial-dev.ala.org.au/geoserver/wms?SERVICE=WMS&amp;', {layers: 'ibra7_regions', format: 'image/png', attribution: '', opacity: '0.25'});

        var IBRA_biosubregions = L.tileLayer.wms('http://spatial-dev.ala.org.au/geoserver/wms?SERVICE=WMS&amp;', {layers: 'ibra7_subregions', format: 'image/png', attribution: '', opacity: '0.25'});

        var clusters = markers.addLayer(myLayer);

        var overlays = {"Clustered Markers": clusters,
             "IBRA Bioregions": IBRA_bioregions,
             "IBRA Subregions": IBRA_biosubregions };

        L.control.layers(baseMaps, overlays).addTo(map);
        L.control.scale({imperial: false}).addTo(map);

        /*
        The tables
        */

        function makeTable(divID, caption, condition) {

        var tabledata = datapointsjson;
        var tablebodydata = tabledata.features.filter(condition);

        if(tablebodydata=='')
            {
            return;
            }

        var datatable = d3.select(divID);

        updateTable();

        function updateTable(){

        var headers = d3.keys(tabledata.features[0].properties);
        tcaption = datatable.select("caption").text(caption);

        var thead = datatable.select("thead");
        var tbody = datatable.select("tbody");

        thead.selectAll("th")
        .data(headers)
        .enter().append("th")
        .text(function(d){return d});

        var tr = datatable.select("tbody").selectAll("tr")
        .data(d3.values(tablebodydata));

        tr.enter()
        .append("tr");

        var td = tr.selectAll("td")
        .data(function(row) {            
        return headers.map(function(d) { 
        return {column: d, value: row.properties[d]};
        });
        });

        tr.selectAll("tbody") 

        td.enter()
        .append("td")
        .text(function (d) {
        return d.value;
        });
        };
        };

        makeTable("#coords_table","Records with coordinates", function(d){return d.geometry!=  null;})
        makeTable("#no_coords_table","Records without coordinates", function(d){return d.geometry==  null;})

        };
    </script>
</xsl:template>

    <xsl:template match="/table/tuple">
        <xsl:variable name="regno"
            select="concat(atom[@name = 'CatPrefix'], atom[@name = 'CatRegNumber'], atom[@name = CatSuffix])"/>
        <xsl:variable name="typestatus"
            select="table[@name = 'Group2']//atom[@name = 'CitTypeStatus']"/>
        <xsl:variable name="typestatusdetails"
            select="concat(table[@name = 'Group2']//atom[@name = 'CitTypeStatus'], ': ', table[@name = 'Group2']//atom[@name = 'ClaGenus'], ' ', table[@name = 'Group2']//atom[@name = 'ClaSpecies'], ' ', table[@name = 'Group2']//atom[@name = 'CitSubspecies'])"/>
        <xsl:variable name="taxon"
            select="translate(table//atom[@name='IdeQualifiedName'], '&quot;', '')"/>
        <!-- Getting the location information from the source specimen if the record has one (i.e. it's a tissue sample) -->
        <xsl:variable name="long">
            <xsl:choose>
                <xsl:when test="tuple[@name = 'SouVoucherHeldRef']/*">
                    <xsl:value-of select="tuple[@name = 'SouVoucherHeldRef']//atom[@name = 'LatLongitudeDecimal']" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="tuple[@name='BioEventRef']//atom[@name = 'LatLongitudeDecimal']"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="lat">
            <xsl:choose>
                <xsl:when test="tuple[@name = 'SouVoucherHeldRef']/*">
                    <xsl:value-of select="tuple[@name = 'SouVoucherHeldRef']//atom[@name = 'LatLatitudeDecimal']"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="tuple[@name='BioEventRef']//atom[@name = 'LatLatitudeDecimal']"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="sitecode">
            <xsl:choose>
                <xsl:when test="tuple[@name = 'SouVoucherHeldRef']/*">
                    <xsl:value-of select="tuple[@name='SouVoucherHeldRef']//atom[@name='ColCollectionEventCode']"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="tuple[@name='BioEventRef']/atom[@name = 'ColCollectionEventCode']"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="nearestnamed">
            <xsl:choose>
                <xsl:when test="tuple[@name = 'SouVoucherHeldRef']/*">
                    <xsl:value-of select="translate(tuple[@name='SouVoucherHeldRef']//atom[@name='LocNearestNamedPlace'], '&quot;', '')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="translate(tuple[@name='BioEventRef']/atom[@name = 'LocNearestNamedPlace'], '&quot;', ' ')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="preciselocation">
            <xsl:choose>
                <xsl:when test="tuple[@name = 'SouVoucherHeldRef']/*">
                    <xsl:value-of select="translate(tuple[@name='SouVoucherHeldRef']//atom[@name='LocPreciseLocation'], '&quot;', '')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="translate(tuple[@name='BioEventRef']/atom[@name = 'LocPreciseLocation'], '&quot;', ' ')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- The specimen data as json -->
        <xsl:text>
            { "type": "Feature",
                    "geometry": </xsl:text>
        <xsl:choose>
            <xsl:when test="$long and $lat and $long !='' and $lat !=''">
                <xsl:text>{"type": "Point",
                            "coordinates": [</xsl:text>
                <xsl:value-of select="concat($long, ',', $lat)"/>
                <xsl:text>]}</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>null</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>,
                    "properties": {
                       "Regno": "</xsl:text>
        <xsl:value-of select="$regno"/>
        <xsl:text>",
                      "Taxon": "</xsl:text>
        <xsl:value-of select="$taxon"/>
        <xsl:if test="$typestatus ">
            <xsl:text>",
                      "TypeStatus": "</xsl:text>
            <xsl:value-of select="$typestatusdetails"/>
        </xsl:if>
        <xsl:text>",
                      "Sitecode": "</xsl:text>
        <xsl:value-of select="$sitecode"/>
        <xsl:text>",
                      "NearestNamedPlace": "</xsl:text>
        <xsl:value-of select="$nearestnamed"/>
        <xsl:text>",
                      "PreciseLocation": "</xsl:text>
        <xsl:value-of select="$preciselocation"/>
        <xsl:text>",
                      "Latitude": "</xsl:text>
        <xsl:value-of select="$lat"/>
        <xsl:text>",
                      "Longitude": "</xsl:text>
        <xsl:value-of select="$long"/>
        <xsl:text>",
                      "IRN": "</xsl:text>
        <xsl:value-of select="atom[@name = 'irn']"/>
        <xsl:text>"}}</xsl:text>
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

</xsl:stylesheet>

