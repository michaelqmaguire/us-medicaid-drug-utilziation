#-----------------------------------------------------------------------------------------------------------------#
#                                                                                                                 #
# PROJECT: US MEDICAID DRUG UTILIZATION                                                                           #
# AUTHOR: MICHAEL MAGUIRE, MS, DMA II                                                                             #
# INSTITUTION: UNIVERSITY OF FLORIDA, COLLEGE OF PHARMACY                                                         #
# DEPARTMENT: PHARMACEUTICAL OUTCOMES AND POLICY                                                                  #
# SUPERVISORS: AMIE GOODIN, PHD MPP | JUAN HINCAPIE-CASTILLO, PHARMD PHD MS                                       #
#                                                                                                                 #
#-----------------------------------------------------------------------------------------------------------------#

## Load packages

library(dplyr)
library(purrr)
library(tidylog)

## Download files

urls <-
  list("https://data.medicaid.gov/api/views/agzs-hwsn/rows.csv?accessType=DOWNLOAD", # 2020
    "https://data.medicaid.gov/api/views/qnsz-yp89/rows.csv?accessType=DOWNLOAD", # 2019
    "https://data.medicaid.gov/api/views/e5ds-i36p/rows.csv?accessType=DOWNLOAD", # 2018
    "https://data.medicaid.gov/api/views/3v5r-x5x9/rows.csv?accessType=DOWNLOAD", # 2017
    "https://data.medicaid.gov/api/views/3v6v-qk5s/rows.csv?accessType=DOWNLOAD", # 2016
    "https://data.medicaid.gov/api/views/ju2h-vcgs/rows.csv?accessType=DOWNLOAD", # 2015
    "https://data.medicaid.gov/api/views/955u-9h9g/rows.csv?accessType=DOWNLOAD", # 2014
    "https://data.medicaid.gov/api/views/rkct-3tm8/rows.csv?accessType=DOWNLOAD", # 2013
    "https://data.medicaid.gov/api/views/yi2j-kk5z/rows.csv?accessType=DOWNLOAD", # 2012
    "https://data.medicaid.gov/api/views/ra84-ffhc/rows.csv?accessType=DOWNLOAD", # 2011
    "https://data.medicaid.gov/api/views/mmgn-kvy5/rows.csv?accessType=DOWNLOAD", # 2010
    "https://data.medicaid.gov/api/views/fhmx-iqs3/rows.csv?accessType=DOWNLOAD", # 2009
    "https://data.medicaid.gov/api/views/ny8j-2ymd/rows.csv?accessType=DOWNLOAD", # 2008
    "https://data.medicaid.gov/api/views/q947-frj2/rows.csv?accessType=DOWNLOAD", # 2007
    "https://data.medicaid.gov/api/views/e7is-4a3j/rows.csv?accessType=DOWNLOAD", # 2006
    "https://data.medicaid.gov/api/views/ezjn-vqh8/rows.csv?accessType=DOWNLOAD", # 2005
    "https://data.medicaid.gov/api/views/rn2y-fgjb/rows.csv?accessType=DOWNLOAD", # 2004
    "https://data.medicaid.gov/api/views/66gr-qxnr/rows.csv?accessType=DOWNLOAD", # 2003
    "https://data.medicaid.gov/api/views/5jcx-2xey/rows.csv?accessType=DOWNLOAD", # 2002
    "https://data.medicaid.gov/api/views/t5ct-xf3k/rows.csv?accessType=DOWNLOAD", # 2001
    "https://data.medicaid.gov/api/views/78qv-c4cn/rows.csv?accessType=DOWNLOAD", # 2000
    "https://data.medicaid.gov/api/views/vhg8-v7wa/rows.csv?accessType=DOWNLOAD", # 1999
    "https://data.medicaid.gov/api/views/ykva-ug36/rows.csv?accessType=DOWNLOAD", # 1998
    "https://data.medicaid.gov/api/views/c7wf-ku3w/rows.csv?accessType=DOWNLOAD", # 1997
    "https://data.medicaid.gov/api/views/jqjw-uby8/rows.csv?accessType=DOWNLOAD", # 1996
    "https://data.medicaid.gov/api/views/v83u-wwk3/rows.csv?accessType=DOWNLOAD", # 1995
    "https://data.medicaid.gov/api/views/8uti-96dw/rows.csv?accessType=DOWNLOAD", # 1994
    "https://data.medicaid.gov/api/views/iu8s-z84j/rows.csv?accessType=DOWNLOAD", # 1993
    "https://data.medicaid.gov/api/views/agzs-hwsn/rows.csv?accessType=DOWNLOAD", # 1992
    "https://data.medicaid.gov/api/views/q7kf-kjqz/rows.csv?accessType=DOWNLOAD"  # 1991
  )

years <-
  c(2020:1991)

download.file(
    destfile = "./data/raw/medicaid-national-data-2020.csv",
    url = "https://data.medicaid.gov/api/views/agzs-hwsn/rows.csv?accessType=DOWNLOAD",
    method = "auto"
)