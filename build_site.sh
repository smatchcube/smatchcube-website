#!/bin/sh

rm -r site
mkdir site
cp -r not_content/. site/
cp -r assets site/assets

options="--mathjax --preserve-tabs --template blog-template.html"

for markdown_file in content/*.md
do
	name=$(basename -s .md "$markdown_file")
	pandoc $options -o ./site/"$name".html ./content/"$name".md
done

for folder_path in content/*/
do
	folder_name=$(basename -s / "$folder_path")
	mkdir ./site/"$folder_name"
	for markdown_file in content/"$folder_name"/*.md
	do
		name=$(basename -s .md "$markdown_file")
		pandoc $options -o ./site/"$folder_name"/"$name".html \
			./content/"$folder_name"/"$name".md
	done
done
