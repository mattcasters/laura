
HOP_LOCATION="$1"
if [ "$HOP_LOCATION" = "" ] || [ ! -d "$HOP_LOCATION" ]
then
  echo
  echo "Please specify the folder where Hop is located ."
  echo "You can do this by giving it to this script as the first argument:"
  echo
  echo "  run-laura.sh /path/to/hop input/folder/"
  echo
  echo "You can download a recent Hop snapshot here:  "
  echo
  echo "  hop.apache.org/download"
  echo
  echo "You can download the Neo4j plugins for Hop here: "
  echo
  echo "  https://github.com/mattcasters/hop-neo4j/releases/latest"
  echo
  exit 1
fi



if [ ! -f "laura-conf.json" ]
then
  echo
  echo "You can copy the file laura-conf.json.sample file to:"
  echo
  echo "  laura-conf.json"
  echo
  echo "In that file you can change the settings for Aura and folder location"
  echo
  exit 2;
fi

PWD=$(pwd)

HOP_OPTIONS=-Xmx512m
HOP_CONFIG_FOLDER=${PWD}/config
HOP_AUDIT_FOLDER=${PWD}/audit

# Create the tmp folder
#
mkdir -p ${PWD}/tmp

export HOP_CONFIG_FOLDER HOP_AUDIT_FOLDER

cd ${HOP_LOCATION}

sh hop-run.sh -e laura -f 'hop/laura.hwf' -r local -l Minimal

