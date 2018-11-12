#!/bin/bash

# Get Old Posts
curl --fail "https://raw.githubusercontent.com/Rbloggers/web/posts/posts.tar.gz" > old.tar.gz 
tar -zxvf old.tar.gz  

## Copy old posts to web/
[[ -d web/_posts ]] || mkdir web/_posts
cp -r _posts/* web/_posts/


# write new posts for every author
ls authors/ > autls
while read p; do
    python3 newpost.py "$p"
    # python write post to web/_posts
done < autls


# Check whether there are new posts

ls _posts/ > old.txt
ls web/_posts/ > new.txt
ln_old=$(cat old.txt | wc -l)
ln_new=$(cat new.txt | wc -l)
dif=$(diff old.txt new.txt)
if [ -z "$dif" ]; then # If empty, i.e. new = old
    echo "No posts created."
elif [[ $ln_new -gt $ln_old ]]; then
    echo "New Posts detected"
elif [[ $ln_new -le $ln_old ]]; then
    echo "More old posts or post name changed. Need inspection"
    exit 100
fi


# Archive All posts
cd web
tar -zcvf posts.tar.gz _posts # Archive _posts
mv posts.tar.gz ../
cd - 

# Move posts.tar.gz to posts_tar/
mkdir posts_tar
mv posts.tar.gz posts_tar/
