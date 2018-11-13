---
layout: join
title: 加入我們
comment: false
author: ['Yongfu Liao','Alan Lee', 'G. T. Wang']
---

## 動機

提交部落格 RSS 至 **[R 部落客](/)**，可讓每次發布的新文章儲存到這裡，並且轉載到臉書上，而讀者也可透過 **R 部落客**中的原文連結找到作者的部落格。**R 部落客**旨在集結散佈各處的臺灣 R 語言部落格寫手，一方面提供大眾一個持續更新的 R 語言資訊來源，另一方面也讓默默耕耘的「R 部落客」能被更多人看見。


## RSS(Atom) 提交規定

### 必要規定

- 所有文章**皆與 R 語言相關**

    - 若部落格有 R 以外的文章，可以提交特定 tag 或是 category 的 RSS feed：
        - [bloggers 說明](https://support.google.com/blogger/answer/97933?topic=12501)
        - [WordPress 說明](https://en.support.wordpress.com/feeds/#your-feeds)
        - Jekyll 可參考[這篇文章](https://devblog.dymel.pl/2017/02/09/category-rss-feed-in-jekyll/)。
        - Hugo 也可用類似 Jekyll 的方式修改 [RSS 模板](https://gohugo.io/templates/rss/)

- 文章需為**繁體中文**

- 提交之 RSS feed **至少有一篇文章**

### 選擇性規定

以下規定能確保您的文章在網頁上**正常顯示**

- RSS feed 為**全文**而非文章摘要

    - WordPress 可在後台設定

    - Hugo 預設為摘要，請將其 [RSS 模板](https://gohugo.io/templates/rss/#the-embedded-rss-xml) 中的：
        
        ```html
        <description>{% raw %}{{ .Summary | html }}{% endraw %}</description>
        ```
        
        改成

        ```html
        <description>{% raw %}{{ .Content | html }}{% endraw %}</description>
        ```
- 文章中的程式碼**不要使用 [GitHub gists](https://help.github.com/articles/about-gists/)**，因為基於安全性問題，任何 `<script>` tag 都會被濾掉。