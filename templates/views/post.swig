{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<p>
			<a href="/blog" class="white">&larr; back to the blog</a>
		</p>
		{% if not data.post %}
			<h2>Invalid Post.</h2>
		{% else %}
		<header>
			<h1>{{ data.post.title }}</h1><br />
			<h5>Posted
				{% if data.post.publishedDate %}
					on {{ data.post._.publishedDate.format("MMMM Do, YYYY") }}
				{% endif %}
				{% if data.post.author %}
					by {{ data.post.author.name.first }}
				{% endif %}
			</h5>
		</header>

		<div class="post brick">

			{% if data.post.image.exists %}
				<div class="image-wrap">
					<img src="{{ data.post._.image.fit(750,450) }}" class="img-responsive">
				</div>
			{% endif %}

			{% if data.post.categories and data.post.categories.length %}
				{% for cat in data.post.categories %}
					<a href="/blog/{{ cat.key }}" class="skill">{{ cat.name }}</a>
					{% if loop.index < data.post.categories.length - 1 %}, {% endif %}
				{% endfor %}
			{% endif %}
			
			<hr />
			<br />
			{{ data.post.content.full | raw }}
			
		</div>
		{% endif %}
	</div>
{% endblock %}
