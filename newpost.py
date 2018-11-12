import sys, os, json

# Get author (path to authors/<author>/new_post.json)
aut = sys.argv[1]
fp = 'authors/' + aut + '/new_post.json'

# Read new_post.json
with open(fp) as f:
    new_post = json.load(f)

# Write Posts (one author) to 'web/_posts'
yaml_aut = 'author: "' + new_post['author'] + '"'
for i in range(0, len(new_post['id'])):
    ## Get filename
    filename = new_post['date'][i] + '-' + aut + '-' + os.path.basename(new_post['id'][i])

    ## Write yaml header
    yaml_title = 'title: "' + new_post['title'][i] + '"'
    yaml_tags = 'tags: ' + str(new_post['tags'][i])
    yaml_link = 'link: "' + new_post['id'][i] + '"'
    content = new_post['content'][i].replace('。', '。<!--more-->', 1) # change 
    
    f = open('web/_posts/'+filename, 'w')
    f.write('---\n')
    f.writelines([yaml_aut,'\n',yaml_title,'\n',yaml_tags,'\n',yaml_link,'\n', 'highlight: true\n'])
    f.write('---\n\n')
    f.write(content)
    f.close()
    
