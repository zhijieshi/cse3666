---
layout: home
---

This site provides supplementary materials for UConn CSE 3666.

<h2> Pages </h2>

<ul>

* [Practice binary numbers](./binarynumbers/)
* [Knowledge on C Language through an example](pages/c_example.html)

{% for t in site.pages %}
<li> <a href="{{ t.url | prepend: site.baseurl }}">
        {{ t.title }}
</a>
</li>
{% endfor %}
</ul>

{% comment %}
{% for collection in site.collections %}
  <h2>{{ collection.label }}</h2>
  <ul>
    {% for item in site[collection.label] %}
      	<li><a href="{{ item.url | prepend: site.baseurl }}">
		{{ item.title }}
	  </a>
        <p class="post-excerpt">{{ item.description | truncate: 160 }}</p>
	</li>
    {% endfor %}
  </ul>
{% endfor %}
{% endcomment %}
