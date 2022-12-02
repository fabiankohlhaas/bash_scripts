#!/bin/bash
echo "🔥🔥🔥 Beginning Build! 🔥🔥🔥"
firstline=$(head -n1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "Building version:" $version
echo "Do you want to continue? (enter "1" for yes, "0" for no)"
echo "Press 1 for yes or 0 to exit"
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for filename in source/*
  do
    if [ $filename == "source/secretinfo.md" ]
    then
      echo $filename "Is not beeing copied"
    else
      echo $filename "Is beeing copied"
      cp $filename build/.
    fi
  done
else
  echo "Please come back when you are ready"
fi
cd build/
echo "Build version $version contains:" 
ls
cd /..
