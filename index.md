---
layout: home
---

This site provides supplementary materials for UConn CSE 3666.

* [Practice binary numbers](./binarynumbers/)
* [Knowledge on C Language through an example](pages/c_example.html)
# * [Q&A](pages/cse3666-qa)

{% for collection in site.collections %}
  <h2>{{ collection.label }}</h2>
  <ul>
    {% for item in site[collection.label] %}
      	<li><a href="{{ item.url | prepend: site.baseurl }}">
		{{ item.title }}
	  </a>
	</li>
    {% endfor %}
  </ul>
{% endfor %}
