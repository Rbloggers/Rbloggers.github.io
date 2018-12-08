## Testing Locally

1. RSSparser
    - INTERRUPT
        - `dowload_oldjson.sh`: line 15 `> "$authorname/old.json"`
    - Normal
        - Do nothing
    2. `python3 main.py`
    2. check JSON with Firefox

1. Rbloggers.github.io/test
    1. Manual move dowloaded author folders to `authors/`
    1. `python3 newpost.py <author_name>`
    1. Check posts in `web/_posts`
