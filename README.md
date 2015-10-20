# XSLT-for-EMu
XSLT reports for KE EMu

This is a selection of XSLT reports for KE EMu

Any improvements would be gratefully received.

## To run the reports from EMu

To run any of these report you'll need to 

+ create a new report of type XSLT report
+ add the required fields to the report
+ upload the XSLT file to EMu
+ *then* run the report

There is sure to be some differences between the fieldnames in the South Australian Museum installation and yours so you may need to change some of the fields. Try them out and if they don't work have a look at the output XML - see below for how to get it - and compare it to the XPath in the XSLT files.

## To test the reports

To test the reports on your own computer you will still need an XML file containing the appropriate fields. To get this file firstly search for a bunch of records *that contain the data you want to report on* (That reminder could save you hours of debugging). Select a manageable amount of records then

Either

1. *Export XML Document* report
  1. Create a new report of type *Export XML Document* 
  2. Add the appropriate fields to the report
  3. Run the report
  4. Save the output to your working directory

or

2. *XSLT report*
  1. Create a new report of type *XSLT report*
  2. Add the appropriate fields to the report
  3. Run the report
  4. Copy the output to your working directory. The output will have been saved to %AppData%\Local\Temp\xmldata.xml


### using the windows command prompt

You should use [cygwin](https://www.cygwin.com/).

If you're *not* using cygwin then from a command prompt run 

    "c:\Program Files (x86)\KESoftware\[Whatever your EMu installation is called]\xslt.exe" [The xslt file name] [the xml file name]

The output file will automatically open in the appropriate program. I was unable to work out how to save the output into a file 

### using cygwin

#### To use the default processor:

    $ /cygdrive/c/Program\ Files\ \(x86\)/KESoftware/[Whatever your EMu installation is called]/xslt.exe [The xslt file name] [the xml file name]

To get the output to automatically open in the appropriate program or 

    $ /cygdrive/c/Program\ Files\ \(x86\)/KESoftware/[Whatever your EMu installation is called]/xslt.exe [The xslt file name] [the xml file name] > [temporary file name.extension]

To save the result to a file

#### To use xsltproc

Install xsltproc (it's not listed explicitly in the repositories, you get it by installing libxml2 and libxslt) then run

    $ xsltproc [The xslt file name] [the xml file name]

To get the output to automatically open in the appropriate program or 

    $ xsltproc [The xslt file name] [the xml file name] > [temporary file name.extension]

To save the result to a file

### Using oXygen XML editor

Have the xml file open in one side of the screen and the xslt file open in the other

1. Click the mouse in the XML file
2. Click the 'play' (Apply Transformation Scenario) buttton
3. Select 'New'
4. Select 'XML Transformation with XSL'
5. Select the XSLT file from the drop-down in XSL URL
6. Select 'OK'
