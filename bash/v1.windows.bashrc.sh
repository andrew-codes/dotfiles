alias bake="bundle exec rake"

function v1() {
    if [-f ./gulp ]; then
        command='./gulp "$@"'
    else
        echo 'No ./gulp file exists.'
        set -e
    fi
    `$command`
}

function v1l ()
{

}

function v1up ()
{
    v1 upgradedb
}

v1nuke ()
{
  # Version="${1:-15.1}"
  # if [ -f $DemoData ]; then
  #   DemoData=$DEV_HOME/utilities/DemoData/${Version}/DemoData.bak
  #   DemoDataWinPath=$(echo $DemoData | sed -e "s/\///" | sed -e "s/\//\\\/g" | sed -e "s/\\\/:\\\/")
  #   sql="
  #     USE [master]
  #     RESTORE DATABASE [VersionOne] FROM  DISK = N'$DemoDataWinPath' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 5
  #     GO
  #   "
  #   iisreset
  #   sqlcmd -S localhost -U sa -P dev -Q "$sql"
  #   sqlcmd -S localhost -U sa -P dev -Q "
  #     USE [VersionOne]
  #     GO
  #     CREATE USER [pub] FOR LOGIN [pub] WITH DEFAULT_SCHEMA=[dbo]
  #     GO
  #     USE [VersionOne]
  #     GO
  #     ALTER ROLE [db_owner] ADD MEMBER [pub]
  #     GO
  #   "
  # fi
  # currentDir=$PWD
  # cd $REPO_HOME/Core
  # upgrade
  # cd $currentDir
}
