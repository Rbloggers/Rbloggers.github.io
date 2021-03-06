import sys, os, json

# Get author (path to authors/<author>/new_post.json)
aut = sys.argv[1]
fp = 'authors/' + aut + '/new_post.json'
print("Start writing " + aut + "\'s new posts ...")

# Exit if new_post.json is empty
if os.path.getsize(fp) == 0:
    print('new_post.json is empty.\nSkipping this author.\n')
    sys.exit(0)
# Read new_post.json
with open(fp) as f:
    new_post = json.load(f)

# Write Posts (one author) to 'web/_posts'
yaml_aut = 'author: "' + new_post['author'] + '"'
base = 'https://rbloggers.github.io/'
for i in range(0, len(new_post['id'])):
    ## Get filename
    filename = new_post['date'][i] + '-' + os.path.basename(new_post['rblog_url'][i])
    
    ## Write New posts
    yaml_title = 'title: "' + new_post['title'][i] + '"'
    yaml_tags = 'tags: '
    ### Deal with empty tag
    if len(new_post['tags'][i][0]) != 0:
        yaml_tags += str(new_post['tags'][i])
    yaml_link = 'link: "' + new_post['id'][i] + '"'
    content = new_post['content'][i].replace('。', '。<!--more-->', 1) # change 
    
    f = open('web/_posts/'+filename, 'w')
    f.write('---\n')
    f.writelines([yaml_aut,'\n',yaml_title,'\n',yaml_tags,'\n',yaml_link,'\n', 'highlight: true\n'])
    f.write('---\n\n')
    f.write(content)
    f.close()

    ## Write Facebook new post data 
    with open('FB_title.txt', 'a') as fp:
        fp.write(new_post['title'][i] + '\n')
    with open('FB_link.txt', 'a') as fpt:
        fpt.write(base + new_post['rblog_url'][i] + '\n')
    with open('FB_tags.txt', 'a') as fp:
        for k in new_post['tags'][i]:
            fp.write(str(k) + ',')
        fp.write('\n')

