# laura

Loader for Aura using Apache Hop

This repository contains an Apache Hop project that can be used to load CSV files into Aura

# Apache Hop & Neo4j

To run Laura you need a recent build of Hop.  You can find a recent snapshot download of Apache Hop over here:

  http://hop.apache.org/download

You also need the latest version of the Neo4j plugins for Hop:

  https://github.com/mattcasters/hop-neo4j/releases/latest

# Running Laura

As a standalone project Laura can be run simply by running the script:

  ```sh run-laura.sh``` (for OSX and Linux variants)
  ```run-laura.bat``` (TODO: for windows variants)

As an argument you can specify the location of where you unzipped Hop with the Neo4j plugins folder hop-neo4j in the plugins/ folder somewhere.

Please make sure to create a laura-conf.json file.  The easiest way to do this is by copying laura-conf.json.sample.
Then modify the file to match your situation: The Aura hostname and password as well as the location of your files.

# The input folder

The input folder contains 2 sub-folders: nodes/ and relationships/.
These will contain one file per (you guessed it) node label and relationship label.

```${INPUT_FOLDER}/nodes``` :

* one file per label, filename is ```<Label>-<property that is unique constraint>.csv```
* all the properties in the file either have a value or no value

```${INPUT_FOLDER}/relationships``` :

* one file per relationshiptype, filename is ```<RELATIONSHIPTYPE>-<StartNodeLabel>-<EndNodeLabel>.csv```
* The header in the file should be in the format: 
  - ```<NodeLabel>.<KeyField>``` if it's a key field
  - A field name without a dot (.) which will become a relationship property



