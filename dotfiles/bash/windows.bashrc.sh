# Windows
if [ "$OSTYPE" == "win"* -o "$OSTYPE" == "msys" ]; then
    function recycle ()
    {
      powershell -Command "& { ([ADSI] 'IIS://localhost/W3SVC/AppPools/ASP.NET v4.0').psbase.invoke('recycle') }"
    }

    [ -f $HOME/v1.windows.bashrc.sh ] && source $HOME/v1.windows.bashrc.sh
fi
