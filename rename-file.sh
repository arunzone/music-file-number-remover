#!/bin/sh
echo "jousgua" | sed 's/\([oa]\)/X\1/g'
regex_pattern="^.*\.(mp3|flac)$"
find . -print0 | while read -d $'\0' file
do
  if [[ "$file" =~ $regex_pattern ]]
  then
    file_name=$(echo "$file" | sed 's/^\.\///g')
    file_name_no_num=$(echo "$file_name" | sed 's/^.*[ ]\-[ ]//g')
    if [ "$file_name" == "$file_name_no_num" ]
    then
      file_name_no_num=$(echo "$file_name" | sed 's/^.*\.[ ]//g')
    fi
    echo "$file_name_no_num"
    mv "$file_name" "$file_name_no_num"
  fi
done

echo "---------------------"

