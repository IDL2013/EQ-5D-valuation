# EQ-5D-valuation

## Intro

This is an overview of the EQ-5D utility calculator app, developed to fulfil the marking criteria for the "Developing Data Products" course assignment.

The EQ-5D (www.euroqol.com) is a commonly used measure of health and asks respondents to value 5 key dimensions of health (mobility, self-care, usual activities, pain and discomfort, and anxiety and depression). The outputs of EQ-5D can be converted into utility/index scores, specific to a number of countries of interest. In this example, only value sets for the UK, US and Canada have been used. 

This handy calculator allows you to quickly evaluate the corresponding utility values relating to individual EQ-5D responses.

*Note: Other scientifically validated EQ-5D calculators exist and this version is not intended for use as a formal research tool*

## Overview of EQ-5D calculator user interface

The app is built in Shiny and hosted at https://idl2013.shinyapps.io/EQ5D_calc/ 

It comprises 4 tabs:

- Background info: an overview page that allows user to select their home country

- EQ-5D inputs: allows users to respond to the 5 dimension questions of EQ-5D

- Rating scale: contains the visual analogue scale for reporting general perceived health

- Outputs: Displays the reported information, and EQ-5D valuations using two different approaches

## Server function

After importing the user inputs, the server makes use of the 'eq5d' package, which can be found on CRAN.

An example calculation for the health state with scores of mobility=1,self-care=2,usual activities=2,pain=3 and anxiety=2 is shown below (for a UK population).

```{r,echo=TRUE}
library(eq5d)
scores = 11223

TTO <- eq5d(scores,version="3L",country="UK",type="TTO",ignore.invalid=FALSE)
utility <- paste("Your utility estimated using the UK value set is:", TTO)
utility

```

## Source code

The source code and user documentation can be found at my github repository:
https://github.com/IDL2013/EQ-5D-valuation 

Thank you!