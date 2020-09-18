---
layout: home
---

# CSE 3666

This site provides supplementary materials for UConn CSE 3666.

{% for collection in site.collections %}

{{ collection.label }}
{% for item in site[collection.label] %}
{{ item.title }}
{% endfor %}
{% endfor %}
