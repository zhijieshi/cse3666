---
layout: home
Title: home
---

This site provides supplementary materials for UConn CSE 3666.

## Links

<ul>
{% for link in site.data.links %}
  <li>
    <a href="{{ link.url }}">
      {{ link.title | escape }}
    </a>
  </li>
{% endfor %}
</ul>

## Pages

<ul>
{% for t in site.pages %}
<li> <a href="{{ t.url | prepend: site.baseurl }}">
        {{ t.title }}
</a>
</li>
{% endfor %}
</ul>

The page was last updated on {{ site.time }}.

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
{% comment %}
{% endcomment %}
