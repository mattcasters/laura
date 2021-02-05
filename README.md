# laura
Loader for Aura using Apache Hop

This repository contains an Apache Hop project that can be used to load CSV files into Aura

# Setup

Add a project to the Hop configuration pointing to this folder.
For example:

$ sh hop-conf.sh -pc -p laura -ph /path/to/this/folder

Now you can create an environment to contain the hostname, username and password of your Aura instance:

$ sh hop-conf.sh -ec -e laura -eg /path/to/laura-conf.json

This creates an empty file called laura-conf.json in which we can store the configuration variables:

$ sh hop-conf.sh -cfg /path/to/laura-conf.json -cfv \
  AURA_HOSTNAME=someweirdhostname.neo4j.io,AURA_USERNAME=neo4j,AURA_PASSWORD=SomePassword

# Workflow to run

The main workflow to run is:

  laura.hwf

If you configured the environment you can run it as:

$ sh hop-run.sh -e laura -f laura.hwf -r local -p INPUT_FOLDER=/input/folder/path

# Parameters

INPUT_FOLDER : points to the input folder containing the files you want to load

# Files

${INPUT_FOLDER}/nodes :

* one file per label, filename is <Label>-<property that is unique constraint>.csv
* all the properties in the file either have a value or no value

${INPUT_FOLDER}/relationships :

* one file per relationshiptype, filename is <RELATIONSHIPTYPE>-<StartNodeLabel>-<EndNodeLabel>.csv
TODO

