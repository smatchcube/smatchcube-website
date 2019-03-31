#!/bin/bash

rm -r site
cp -r not_content site

math=--mathjax

for markdown in content/*.md
do
	name=$(basename -s .md $markdown)
	pandoc $math --preserve-tabs --template blog-template.html -o ./site/$name.html ./content/$name.md
done

for folder_path in $(ls -d content/*/)
do
	folder=$(basename -s / $folder_path)
	mkdir ./site/$folder
	for markdown in content/$folder/*.md
	do
		name=$(basename -s .md $markdown)
		pandoc $math --preserve-tabs --template blog-template.html -o ./site/$folder/$name.html ./content/$folder/$name.md
	done
done

cp -r assets site/assets
