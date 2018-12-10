---
layout: join
title: 加入我們
comment: false
author: ['Yongfu Liao','Steve Chen', 'Alan Lee', 'G. T. Wang']
---

## 動機

**R部落客**旨在集結散佈臺灣各處的 R 語言部落格寫手，一方面提供大眾持續更新的 R 語言資訊，另一方面也讓默默耕耘的「R部落客」能被更多人看見。

提交部落格的 RSS 至 **[R部落客](./join.html)**，可讓每次新發布的文章儲存到這裡，並轉載到[臉書](https://www.facebook.com/twRblogger)上。讀者更可透過 **R部落客**文章中的原文連結，認識到作者的部落格。

## RSS(Atom) 提交規定

### 必要規定

1. 所有文章**皆與 R 語言相關**

    - 若部落格有 R 以外的文章，可以提交特定 tag 或是 category 的 RSS。下方提供各部落格平台的 RSS 網址格式或設定說明：
        - [bloggers 說明](https://support.google.com/blogger/answer/97933?topic=12501)
        - [WordPress.com 說明](https://en.support.wordpress.com/feeds/#your-feeds)
        - [WordPress.org 說明](https://codex.wordpress.org/WordPress_Feeds#Categories_and_Tags)
        - Jekyll 部落格[自訂 RSS 模板](https://devblog.dymel.pl/2017/02/09/category-rss-feed-in-jekyll/)
        - Hugo 也有類似 Jekyll 修改 [RSS 模板的功能](https://gohugo.io/templates/rss/)

1. 文章需為**繁體中文**

1. 提交之 RSS feed **至少有一篇文章**

### 選擇性規定

以下規定能確保您的文章在網頁上**正常顯示**

1. RSS feed 為**全文**而非文章摘要

    - WordPress 可在後台設定

    - Hugo 預設為摘要，請將其 [RSS 模板](https://gohugo.io/templates/rss/#the-embedded-rss-xml) 中的：
        
        ```html
        <description>{% raw %}{{ .Summary | html }}{% endraw %}</description>
        ```
        
        改成

        ```html
        <description>{% raw %}{{ .Content | html }}{% endraw %}</description>
        ```
1. 文章中的程式碼**不要使用 [GitHub gists](https://help.github.com/articles/about-gists/)**，因為基於安全性問題，任何 `<script>` tag 都會被濾掉。

### 提交 RSS

[Google 表單](http://bit.ly/AppRblog)