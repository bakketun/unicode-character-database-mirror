#!/bin/sh

echo "Delete directory Public and redownloads from https://www.unicode.org/Public/"
echo "Press enter to continue."
read confirm

rm -r Public
mkdir Public

(cd Public
 wget https://www.unicode.org/Public/ReadMe.txt

 mkdir -p zipped/13.0.0
 (cd zipped/13.0.0
  wget https://www.unicode.org/Public/zipped/13.0.0/ReadMe.txt

  mkdir UCD
  (cd UCD
   wget https://www.unicode.org/Public/zipped/13.0.0/UCD.zip
   unzip UCD.zip)

  mkdir Unihan
  (cd Unihan
   wget https://www.unicode.org/Public/zipped/13.0.0/Unihan.zip
   unzip Unihan.zip)))

git clean -fX Public/
