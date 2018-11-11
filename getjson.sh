#!/bin/bash

### This script gets newly parsed data from RSSparser
### serving as 
###   1) data source for RSSparser to compare new & old json
###   2) new_post for creating post

# Get Author list
curl https://rbloggers.github.io/RSSparser/authorlist.txt > authorlist.txt

# Pull data from RSSparser
[[ -d authors ]] || mkdir authors
cd authors
while read p; do
    dirname=$(echo "$p" | cut -d ',' -f 1)
    
    # Check if dir exist
    [[ -d $dirname ]] || mkdir $dirname
    # Download old data
    curl --fail "https://rbloggers.github.io/RSSparser/$dirname/new.json" > "$dirname/new.json"
    
    # Dowload new_post data
    curl --fail "https://rbloggers.github.io/RSSparser/$dirname/new_post.json" > "$dirname/new_post.json"
done < ../authorlist.txt
cd -

rm authorlist.txt
