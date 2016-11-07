#!/bin/bash

function recycle ()
{
  powershell -Command "& { ([ADSI] 'IIS://localhost/W3SVC/AppPools/ASP.NET v4.0').psbase.invoke('recycle') }"
}

alias bc="/C/Program\ Files/Beyond\ Compare\ 4/BCompare.exe"
PATH=$PATH:$DEVELOPER_UTILITIES_HOME/curl-7.50.3/usr/bin
