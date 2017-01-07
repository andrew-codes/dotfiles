#!/bin/bash

function recycle ()
{
  powershell -Command "& { ([ADSI] 'IIS://localhost/W3SVC/AppPools/ASP.NET v4.0').psbase.invoke('recycle') }"
}

PATH=$PATH:$DEVELOPER_UTILITIES_HOME/curl-7.50.3/usr/bin
