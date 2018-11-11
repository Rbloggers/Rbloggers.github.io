#!/bin/bash

# Get Old Posts
curl --fail "https://raw.githubusercontent.com/Rbloggers/web/posts/posts.tar.gz" > old.tar.gz 
tar -zxvf old.tar.gz  
## Copy old posts to web/
cp -r _posts/* web/_posts/


# write new post
## To Do: 
##   1. write yaml 
##      1. Author, title, tags, link, highlight:true
##   2. file name (date + author + link_end): _EOF_, rand_generator
##   2. insert HTML + insert <!--more--> before the first </p>

# Archive All posts
cd web
tar -zcvf posts.tar.gz _posts # Archive _posts
mv posts.tar.gz ../
cd - 

# Check whether there are new posts
ls _posts/ > old.txt
ls web/_posts/ > new.txt
dif=$(diff old.txt new.txt)
if [ -z "$dif" ]; then # If empty, i.e. new = old
    echo "No new posts created."
    echo "Use old.tar.gz"
    rm posts.tar.gz
    mv old.tar.gz posts.tar.gz
else
    echo 'New Posts detected'
fi

# Move posts.tar.gz to posts_tar/
mkdir posts_tar
mv posts.tar.gz posts_tar/
