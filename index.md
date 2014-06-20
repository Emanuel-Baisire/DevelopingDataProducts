---
title       : Coursera "Developing Data Products" Assignment
subtitle    : Shiny App Description
author      : Ioanna Aristeidopoulou
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]            # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
---

## Description of my Shiny Application

The purpose of this application is to allow the user explore the US State data.

- The user selects the data dimension he/she wants to display.
  This can be one of the following:
  - Population, 
  - Income, 
  - Illiteracy, 
  - Life.Exp, 
  - Murder, 
  - HS.Grad, 
  - Frost, 
  - Area.      
- An intensity map is displayed for the selected dimension  
- The color intensity of each state corresponds to the value of the selected dimension

--- .class #id 

## ui.R Code

This is the user interface part of my shiny app:


```r
library(shiny)
require(datasets)
states <- data.frame(state.name, state.x77)
shinyUI(fluidPage(
        # Application title
        titlePanel("US State Data"),
        # Sidebar with controls to select the data index to display in Geo Chart
        sidebarLayout(sidebarPanel(
                selectInput("dataIndex", "Select Data Index:", choices=colnames(states[,-1])),hr()),
                # Show the google map
                mainPanel(h3(textOutput("dataIndex")),htmlOutput("view")))))
```


--- .class #id 
## server.R Code

This is the server part of my shiny app:


```r
library(shiny)
library(googleVis)
require(datasets)
states <- data.frame(state.name, state.x77)
shinyServer(function(input, output) {
    output$dataIndex <- reactive({
        switch(input$dataIndex, Population = "Population", Income = "Income", 
            Illiteracy = "Illiteracy", Life.Exp = "Life.Exp", Murder = "Murder", 
            HS.Grad = "HS.Grad", Frost = "Frost", Area = "Area")
    })
    output$view <- renderGvis({
        gvisGeoChart(states, locationvar = "state.name", colorvar = input$dataIndex, 
            options = list(region = "US", displayMode = "regions", resolution = "provinces", 
                width = 600, height = 400))
    })
})
```


--- .class #id 
## US State Intensity Map

<div align="center">
<iframe 
src="http://iaristeid.shinyapps.io/DataProducts/" >
  </iframe></div>


<!-- GeoChart generated in R 3.1.0 by googleVis 0.5.2 package -->
<!-- Fri Jun 20 04:01:25 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID1d2c49f46686 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Alabama",
3615 
],
[
 "Alaska",
365 
],
[
 "Arizona",
2212 
],
[
 "Arkansas",
2110 
],
[
 "California",
21198 
],
[
 "Colorado",
2541 
],
[
 "Connecticut",
3100 
],
[
 "Delaware",
579 
],
[
 "Florida",
8277 
],
[
 "Georgia",
4931 
],
[
 "Hawaii",
868 
],
[
 "Idaho",
813 
],
[
 "Illinois",
11197 
],
[
 "Indiana",
5313 
],
[
 "Iowa",
2861 
],
[
 "Kansas",
2280 
],
[
 "Kentucky",
3387 
],
[
 "Louisiana",
3806 
],
[
 "Maine",
1058 
],
[
 "Maryland",
4122 
],
[
 "Massachusetts",
5814 
],
[
 "Michigan",
9111 
],
[
 "Minnesota",
3921 
],
[
 "Mississippi",
2341 
],
[
 "Missouri",
4767 
],
[
 "Montana",
746 
],
[
 "Nebraska",
1544 
],
[
 "Nevada",
590 
],
[
 "New Hampshire",
812 
],
[
 "New Jersey",
7333 
],
[
 "New Mexico",
1144 
],
[
 "New York",
18076 
],
[
 "North Carolina",
5441 
],
[
 "North Dakota",
637 
],
[
 "Ohio",
10735 
],
[
 "Oklahoma",
2715 
],
[
 "Oregon",
2284 
],
[
 "Pennsylvania",
11860 
],
[
 "Rhode Island",
931 
],
[
 "South Carolina",
2816 
],
[
 "South Dakota",
681 
],
[
 "Tennessee",
4173 
],
[
 "Texas",
12237 
],
[
 "Utah",
1203 
],
[
 "Vermont",
472 
],
[
 "Virginia",
4981 
],
[
 "Washington",
3559 
],
[
 "West Virginia",
1799 
],
[
 "Wisconsin",
4589 
],
[
 "Wyoming",
376 
] 
];
data.addColumn('string','state.name');
data.addColumn('number','Population');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID1d2c49f46686() {
var data = gvisDataGeoChartID1d2c49f46686();
var options = {};
options["width"] =    200;
options["height"] =    100;
options["region"] = "US";
options["displayMode"] = "regions";
options["resolution"] = "provinces";

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID1d2c49f46686')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID1d2c49f46686);
})();
function displayChartGeoChartID1d2c49f46686() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID1d2c49f46686"></script>
 
<!-- divChart -->
  
<div id="GeoChartID1d2c49f46686"
  style="width: 200px; height: 100px;">
</div>


