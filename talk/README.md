# XSLT reports

Keith Maguire - South Australian Museum

September 2015


## Excel report with choices

Getting data from different fields depending on the values in a particular field. Here getting the values from different fields for vouchered and un-vouchered tissues:

![](https://github.com/samuseum/XSLT-for-EMu/raw/master/talk/images/excel%20report%20with%20tissues.PNG)



## CSV import report

![](https://github.com/samuseum/XSLT-for-EMu/raw/master/talk/images/csv%20import%20report.PNG)


## page view with map

![](https://github.com/samuseum/XSLT-for-EMu/raw/master/talk/images/page%20view%20with%20map.PNG)


## kml report

![](https://github.com/samuseum/XSLT-for-EMu/raw/master/talk/images/kml%20report.PNG)


## species occurrence report

![](https://github.com/samuseum/XSLT-for-EMu/raw/master/talk/images/species%20occurrence%20report.PNG)


## zoomable map with overlays

![](https://github.com/samuseum/XSLT-for-EMu/raw/master/talk/images/multi%20point%20map%20report.PNG)


## XSLT

e**X**tensible  **S**tylesheet **L**anguage **T**ransformations



## XSLT

XML+XSLT >processor> output



## Original XML 


~~~~~~~~~~ {.xml}
<specimen>
    <prefix>A</material>
    <regno>1234</colour>
    <collection>Entomology</texture>
    <identification>Camponotus</identification>
    <location>Australia</location>
</specimen>

~~~~~~~~~~~~~~


## to XML

~~~~~~~~~~ {.xml}
<record>
    <entomology>
        <type>specimen</type>
        <registration>A1234<registration>
        <id>Camponotus</id>
        <collected>Australia</collected>
    </entomology>
</record>

~~~~~~~~~~~~~~

## to text

    prefix, regno, collection, identification, location
    A     , 1234 , Entomology, Camponotus    , Australia



## to HTML

~~~~~~~~~~~~~{.html}

<h2>Entomology</h2>
<h3>A1234</h3>
<p><em>Camponotus from australia</em></p>

~~~~~~~~~~~~~

<h2>Entomology</h2>
<h3>A1234</h3>
<p><em>Camponotus from australia</em></p>


## Why use XSLT with EMu?

+ Already built into EMu
+ XML is the default output
+ No limits on the reach of the report
+ Extremely varied output
+ Old - lots of support on internet!


## Cons

+ initially confusing
    + Verbose at some times
    + Terse at others
+ Can get slow > c.100,000 bits of data
    + (10,000 records with 10 fields)
+ in-built processor 
    + no error messages


## XSLT

![](images\xsl example.PNG)




## Reporting

Create XSL report with required fields

Upload the XSLT file

Run the report

## Testing / admin

Generate XML report with required fields

Run transform on computer


## EMu XML 

~~~{.xml}
<stuff />               # XML stuff
<table>                 # Module name
    <tuple >            # One for each record 
        <atom/>
        <tuple>         # all
            <atom />    # the
        </tuple>        # fields
        <table>         # in 
            <atom />    # the 
            <tuple />   # report
          [...]  
    </tuple>
    <tuple>[...]</tuple># next record
    <tuple>[...]</tuple># next record
    <tuple>[...]</tuple># next record
</table>
~~~~~~~~

## General structure of XSLT report file

~~~~~~~~~~~~~{.xml}

    <Output> XML/HTML/text
      Start
        <apply-templates />
      End
    </Output>

    <template match="/table/tuple">
        A single record
    </template>

~~~~~~~~~~~~~~~~~~~~~~~~~~

## Text files

## CSV file


~~~~~~~~~~~~~~~~~~~~~~~~~~{.xml}

    <Output> text file
      "field 1", "field 2", "field 3"
        <apply-templates />
    </Output>

    <template match="table/tuple">
        "(value of) field 1"
        , "(value of) field 2"
        , "(value of) field 3"
        (newline)
    </template>

~~~~~~~~~~~~~~~~~~~~~~~~~~

## CSV import file

~~~~~~~~~~~~~{.xml}

    <Output> text file 
       "irn", "update field1", "update field2"
        <apply-templates />
    </Output>

    <template match ="/table/tuple">
        <if test="tissue id != specimen id">
            "(value of) field 1"
          , "(value of) field 2"
          , "(value of) field 3"
            (newline)
        </if>
    </template>

~~~~~~~~~~~~~~~~~~~~~~~~~~

## csv import report

![](images\csv import report.PNG)



## XML files



## XML imports

~~~~~~~~~~~~~{.xml}

    <Output_file> XML file 
        <apply-templates />
    </Output_file>

    <template match="/table/tuple/irn"/>

    <template match="CatPrefix">
        <text>R</text>
    <template>
    <template match="SouRegNo">
        <CatRegNumber>
     <value-of select="substring-after(., 'R')"/>
        <CatRegNumber>
    </template>
    
    <identity_transform/>

~~~~~~~~~~~~~~~~~~~~~~~~~~



## KML XML file


~~~~~~~~~~~~~{.xml}
         
    <Output_file> XML file *Sneaky trick*
        KML stuff
        Style choices
            <apply-templates />
        more KML stuff
    </Output_file>
    
    <template match ="table/tuple">
         XML for each record
            if coordinates: style 1
            if no-coordinates: style 2
            if no locality: style 3
    </template>

~~~~~~~~~~~~~~~~~~~~~~~~~~



## Sneaky trick for KML

(This is invalid XSL)

    version="XSLT 2.0"

    output method="kml"

output = filename.kml



## kml report

![](images\kml%20report.PNG)


## Excel XML

Speadsheet ML

+ From Excel *2003*

+ File 
    + Save as...
        + XML Spreadsheet 2003 

(Remove items until failure)

## Excel XML report

~~~~~~~~~~~~~{.xml}

    <Output_file> XML file - open with Excel
        Excel XML stuff
        Headers in XML form
            <apply-templates />
    </Output_file>

    <template match ="/table/tuple">
        a record in XML form
            incorporating logic where required
    </template>

~~~~~~~~~~~~~~~~~~~~~~~~~~

## Excel with choices

~~~~~~{.xml}
<choose>
    <when test="this">
        <value-of select="one value">
    </when>
    <otherwise>
        <value-of select="default">
    </otherwise>
</choose>

~~~~~~~~~~


## Excel with choices

![](images\excel report with tissues.PNG)


## Excel with data manipulation

~~~~~~{.xml}

<call-template name="range">
    <with-param name="date1">
        <value-of select="The first date field">
    </param>
    <with-param name="date2">
        <value-of select="The second date field">
    </param>
</call-template>

<template name="range">
    <parameter name="date1" />
    <parameter name="date2" />
    (((make a range of dates)))
</template>
~~~~~~~~~~~~~~~~~~~~~~



## HTML files

### + javascript

## Default Page view 

![default page view](images\default%20page%20view.PNG)



## Page view with map

~~~~~~~{.xml}

    <HTML>
            <head>
                <script>Google map</script>
                <styles/>
            </head>
            <body>
                <call-template name="map" />
                <call-template name="data" />
            </body>
    </HTML>
    
    <template name="map">
         make map using lat and long from record
    <template>
    <template name="data">
        data stuff
    </template>
~~~~~~~~~~~~~



## Page view with map

![page view with map](images\page%20view%20with%20map.PNG)



## Javascript libraries

### D3.js

### Leaflet


## turn data into JSON

~~~~~~~~{.json}
 var datapointsjson = { "type": "FeatureCollection",
    "features": [
    { "type": "Feature",
        "geometry": {"type": "Point",
            "coordinates": [145.633,-16.817]},
        "properties": {
          "Regno": "32-032611",
          "Taxon": "Ismarus tibialis Dodd, 1926",
          "TypeStatus": "Type: Ismarus tibialis ",
          "IRN": "579709"}}]};

~~~~~~~~~~~~~~~~~~~~~~~~~~~                      



## Species occurrence report

~~~~~~~~~~~~~{.xml}
    <HTML>
            <head>
                <script>D3.js</script>
                <script>Map in GEoJSON form</script>
                    <apply-templates />
                javascript looping through record JSON
                <styles/>
            </head>
            <body>
                SA Museum etc
                Placeholder for map(s)
                Placeholder for data table
    </HTML>

    <template>
        record as JSON; list of species 
    </template>
~~~~~~~~~~~~~~~~~~~~~~~~~~



## species occurrence report

![](images\species%20occurrence%20report.PNG)

## WMS and Leaflet

Leaflet = google-maps style maps

WMS = base maps & overlays

+ Atlas of Living Australia
+ Geoscience Australia 
+ etc

## Zoomable map report

~~~~~~~~~~~~~{.xml}

    <HTML>
        <head>
            <script>D3.js and Leaflet</script>
            <apply-templates />
            <styles/>
        </head>
        <body>
            SA Museum etc
            Placeholder for map
            Placeholder for data table
        </body>
    </HTML>
    <template match="/table/tuple">
        record as JSON 
    </template>

~~~~~~~~~~~~~~~~~~~~~~~~~~

## zoomable map with overlays

![](images\multi%20point%20map%20report.PNG)



## required software

+ text editor
    + Notepad++ / oXygen
+ xslt processor
    + xsltproc / lxml / oXygen
+ shell
    + Windows Linux Subsystem / Command Prompt / cygwin




keith.maguire@samuseum.sa.gov.au

https://github.com/samuseum

