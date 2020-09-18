---
layout: home
---

# CSE 3666

This site provides supplementary materials for UConn CSE 3666.

<ul>
<li> [Practice binary numbers](./binarynumbers/) </li>
<li> [Knowledge on C Language through an example](c_example.html) </li>
<li> [Q&A](cse3666-qa.md)</li>
</ul>

{% for collection in site.collections %}

{{ collection.label }}
{% for item in site[collection.label] %}
{{ item.title }}
{% endfor %}
{% endfor %}
