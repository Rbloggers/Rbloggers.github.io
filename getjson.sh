#!/bin/bash

### This script gets newly parsed data from RSSparser
### serving as 
###   1) data source for RSSparser to compare new & old json
###   2) new_post for creating post

# Get Author list
curl --silent --show-error --fail "https://raw.githubusercontent.com/Rbloggers/RSSparser/gh-pages/authorlist.txt" > "authorlist.txt"
echo -e "Curl authorlist.txt\n"

# Pull data from RSSparser
[[ -d authors ]] || mkdir authors

cd authors
while read p; do
    dirname=$(echo "$p" | cut -d ',' -f 1)
    
    # Check if dir exist
    [[ -d $dirname ]] || mkdir $dirname
    # Download old data
    #curl --silent --show-error --fail "https://raw.githubusercontent.com/Rbloggers/RSSparser/gh-pages/$dirname/new.json" > "$dirname/new.json"
    #echo -e "Curl $dirname/new.json\n"

    # Dowload new_post data
    curl --silent --show-error --fail "https://raw.githubusercontent.com/Rbloggers/RSSparser/gh-pages/$dirname/new_post.json" > "$dirname/new_post.json"
    echo -e "Curl $dirname/new_post.json\n"
done < ../authorlist.txt
cd -

rm authorlist.txt

# Make json files available in posts branches
#cp -r authors/ web/
mkdir posts_tar
cp -r authors/ posts_tar/
