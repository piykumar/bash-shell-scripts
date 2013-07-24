#!/bin/bash
#         Image Conversion script
#         Written by Piyush
#         piykumar@gmail.com
#         Uses ImageMagick(convert)
#
function usage {
echo ""
echo "Image Conversion script"
echo "    Written by Piyush"
echo "      piykumar@gmail.com"
echo ""
echo "Not enough parameters provided."
echo "Usage: ./$0 startdir"
echo ""
}
recursive () {
first_directory="$1"
cd "$first_directory"
directory_array=(*);
for directory in "${directory_array[@]}" ; do
if [ -d "$directory" ] ; then
(( directory_count += 1 ))
recursive "$directory"
echo "In Directory : "`pwd`
convertimg
cd ..
fi
done
}

function convertimg {
for img1 in $(ls *.{jpg,jpeg,png,gif});
do
img=$(echo "$img1″ | sed -e 's/\.\///g')
if [ $(echo $img | egrep -i 'thumb-|small-|medium-|large-' | wc -l) -le 0 ]
then
# Thumbnail
if [ -f thumb-$img ]
then
echo "Image :"$img" already has a thumbnail"
else
echo "Processing Image : "$img
#convert -quality 80 -thumbnail 75×75 $img thumb-$img
fi
# Small Image
if [ -f small-$img ]
then
echo "Image :"$img" already has a small image"
else
echo "Processing Image : "$img
#convert
fi
# Medium Image
if [ -f medium-$img ]
then
echo "Image :"$img" already has a medium image"
else
echo "Processing Image : "$img
#convert
fi
# Large Image
if [ -f large-$img ]
then
echo "Image :"$img" already has a large image"
else
echo "Processing Image : "$img
#convert
fi
fi
done
}

#check for required parameters
if  [ ${#1} -gt 0  ];
then
cd $1
echo "In Directory : "$(pwd)
convertimg
recursive "$1″
echo "$directory_count directories processed."
else
#print usage information
usage
fi