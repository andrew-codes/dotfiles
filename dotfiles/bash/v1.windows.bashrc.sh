alias bake="bundle exec rake"

function v1() {
    if ! [ -f ./gulp ]; then
        echo 'No ./gulp file exists.'
        return
    fi
    ./gulp "$@"
}

function v1l ()
{
    bake license:dev
}

function v1db ()
{
    v1 initializedb
}

function v1up ()
{
    v1 upgradedb
}

v1nuke ()
{
  DemoDataDirectory=$DEV_HOME/Data/Demo

  Version="${1:-16.1}"
  DemoDataFile=$DemoDataDirectory/$Version/V1Demo-$Version.0.0.bak
  if [ ! -f $DemoDataDirectory/$Version ]; then
    mkdir -p $DemoDataDirectory/$Version
  fi
  if [ ! -f $DemoDataFile ]; then
    curl http://artifactory.dev.corp.versionone.net/artifactory/lifecycle-demodata/$Version/V1Demo-$Version.0.0.bak --output $DemoDataFile
  fi
  DemoDataWinPath=$(echo $DemoDataFile | sed -e "s/\///" | sed -e "s/\//\\\/g" | sed -e "s/\\\/:\\\/")
    sql="
      USE [master]
      RESTORE DATABASE [LifeCycle-$Version] FROM  DISK = N'$DemoDataWinPath' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 5
      GO
    "
    iisreset
    sqlcmd -S localhost -U sa -P dev -Q "$sql"
    sqlcmd -S localhost -U sa -P dev -Q "
      USE [LifeCycle-$Version]
      GO
      CREATE USER [pub] FOR LOGIN [pub] WITH DEFAULT_SCHEMA=[dbo]
      GO
      USE [LifeCycle-$Version]
      GO
      ALTER ROLE [db_owner] ADD MEMBER [pub]
      GO
    "
}
