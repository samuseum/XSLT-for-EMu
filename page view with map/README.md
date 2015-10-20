# Page View with a Map

This report adds a small Google map to the Page view in the Catalogue module

If there are multimedia images the first one will be displayed alongside the map

As with any page view, to use this create a new report of type **XSLT report**, add the fields specified and upload the XSLT file to the EMu server. Now run the report once on a single record and it should work when you select it as your page view.

In everyday use the first time you run it it will take a few seconds to get the supporting things for the map.

![page view with map](https://raw.githubusercontent.com/keithmaguire/XSLT-for-EMu/master/talk/images/page%20view%20with%20map.PNG)

The general structure is

```
XSLT stuff
Assigning variables to each of the fields in the report
A HTML page
  <head>
    call to the template with the CSS for everything
    call to the template with the javascript for everything
  </head>
  <body>
    A header with the summarydata
    Image (if present)
    Map (if coordinates present)
    A table with a row for each value
        The prompt written in
        The value, called referring to the variables above
  </body>
XSL template with the CSS
XSL template with the javascript

```


There are three files here:

## Page view html

This is the HTML that the EMu output XML gets turned into.

## Basic ecatalogue page view with map

This is a reasonably basic page view. It requires the following fields to be added to the Page View report before it's run.

+ Catalogue
++ SummaryData
++ Prefix
++ Registration Number
++ Suffix
++ Date Collected
+ Multimedia
++ Multimedia
+ CollectionEvents
++ Latitude (preferred centroid)
++ Longitude (preferred centroid)
++ radius(Numeric)
++ Date visited (from)
++ Date visited (to)
++ Summary Data


## Ecatalogue page view with logic for tissues

This is a more complicated example showing the use of more logic to allow for information about tissues to be obtained from the source specimen. I've included it here to show how the basic page view can be adapted to accommodate hierarchical collection items.
