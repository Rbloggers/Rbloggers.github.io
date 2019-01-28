#<img src="RmdOutputFormats.png" style="width:30%;float: right;padding-left:18px">

# take a string as input, output modified string

def prepend_baseurl(string, baseurl = 'https://rbloggers.github.io/assets/'):
    import re
    # Case: relative path (./xxxx or xxxx)
    pat_dotSlash = re.compile(r"<img src=[\"\'](\./\S+)[\"\']")
    pat_dotSlash.sub()
    
    pat_char = re.compile(r"<img src=[\"\'][a-zA-Z_]\S+[\"\']")
    
    # Case: absolute path (/xxxx)
    string.replace('', '')
