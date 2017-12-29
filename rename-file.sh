#!/bin/sh
echo "jousgua" | sed 's/\([oa]\)/X\1/g'
regex_pattern="^.*\.(mp3|flac|m4a)$"
find . -print0 | while read -d $'\0' file
do
  if [[ "$file" =~ $regex_pattern ]]
  then
    file_name=$(echo "$file" | sed 's/^\.\///g')
    file_name_no_num=$(echo "$file_name" | sed 's/^[0-9]*\([ ]\)*\([ ]\-[ ]\)*\(\.[ ]\)*//')
    echo "$file_name --> $file_name_no_num"
    mv "$file_name" "$file_name_no_num"
  fi
done

echo "---------------------"

