#!/bin/bash

## Environment ##
REPO_ROOT=`git rev-parse --show-toplevel`

# exit if any command fails
set -e

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   echo "Script for building my redhat docker image."
   echo
   echo "Syntax: ./build.sh [-v|-h]"
   echo "Options:"
   echo "-v|--verbose Enables verbose output."
   echo "-h|--help	Prints this usage."
   echo
}


################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################

## Parse command line arguments ##
POSITIONAL=()
while [[ $# -gt 0 ]]; do
   key="$1"

   case $key in
      -v|--verbose)
         set -x
         shift
         ;;
      -h|--help)
         Help
         shift
         exit
         ;;
      *)    # unknown option
         shift
         ;;
   esac
done

## build the docker image ##
docker build -t $USER/redhat-dev $REPO_ROOT
