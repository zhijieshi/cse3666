---
layout: home
---

This site provides supplementary materials for UConn CSE 3666.

* [Practice binary numbers](./binarynumbers/)
* [Knowledge on C Language through an example](pages/c_example.html)
* [Q&A](pages/cse3666-qa.md)</li>

{% for collection in site.collections %}

{{ collection.label }}
{% for item in site[collection.label] %}
{{ item.title }}
{% endfor %}
{% endfor %}
