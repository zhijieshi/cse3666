---
layout: home
---

This site provides supplementary materials for UConn CSE 3666.

## Links

* [A game for practicing with binary/hexadecimal/2's complement numbers](./binarynumbers/)

* [Understanding C program through an example](pages/c_example.html)

* [MIPS function examples](https://github.com/zhijieshi/cse3666/tree/master/code-examples/mips-function)

## Pages

<ul>
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
