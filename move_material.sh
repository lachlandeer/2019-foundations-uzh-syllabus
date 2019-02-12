#!/bin/bash

PDF=$1
README=$2

# get path to course material
COURSE_MATERIAL=$(find $3 -name $4)
echo "Course Materials are located in:"
echo "$COURSE_MATERIAL"

# create material folder
MATERIAL_FOLDER=$COURSE_MATERIAL/$5
echo "Intro slides will go to:"
echo "$MATERIAL_FOLDER"
mkdir $MATERIAL_FOLDER

# # send slides to material folder
echo "copying files to material folder"
# echo "cp $1 $MATERIAL_FOLDER"
cp $PDF $MATERIAL_FOLDER

# echo "cp $1 $MATERIAL_FOLDER"
cp $README $MATERIAL_FOLDER

# push material online
cd $COURSE_MATERIAL && \
    echo "switching to $COURSE_MATERIAL" && \
    echo "updating local repo" && \
    git pull && \
    echo "adding new files" && \
    git add . && \
    git commit -am "update syllabus" && \
    echo "pushing new material online" && \
    git push
