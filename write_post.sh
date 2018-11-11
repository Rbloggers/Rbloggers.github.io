#!/bin/bash

# Get Old Posts
curl --fail "https://raw.githubusercontent.com/Rbloggers/web/posts/posts.tar.gz" > old.tar.gz 
tar -zxvf old.tar.gz  
## Copy old posts to web/
cp -r _posts/* web/_posts/


# write new post
## To Do: 
##   1. write yaml and file name (author, date): _EOF_, rand_generator
##   2. insert HTML + insert <!--more-->

# Archive All posts
cd web
tar -zcvf posts.tar.gz _posts # Archive _posts
mv posts.tar.gz ../
cd - 

# Compare size of old.tar.gz & posts.tar.gz
new=$(stat --printf="%s" posts.tar.gz)
old=$(stat --printf="%s" old.tar.gz)
if [[ $old -gt $new ]]; then 
    echo 'old.tar.gz is larger than posts.tar.gz (Need checking)'
    echo 'Use old.tar.gz instead'
    rm posts.tar.gz
    mv old.tar.gz posts.tar.gz
elif [[ $old -eq $new ]]; then
    echo 'old.tar.gz is equal to posts.tar.gz'
    echo 'Use old.tar.gz instead'
    rm posts.tar.gz
    mv old.tar.gz posts.tar.gz
else
    echo 'Use posts.tar.gz'
fi

# Move posts.tar.gz to posts_tar/
mkdir posts_tar
mv posts.tar.gz posts_tar/
