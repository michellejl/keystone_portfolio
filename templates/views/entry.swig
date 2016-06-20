{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">

		<p>
			<a href="/journal" class="white">&larr; back to the journal</a>
		</p>
		<hr>
		{% if not data.entry %}
		<h2>Invalid Entry.</h2>
		{% else %}
			
		<header>
			<h1>{{ data.entry.title }}</h1><br />
			<h5>Posted
				{% if data.entry.publishedDate %}
					on {{ data.entry._.publishedDate.format("MMMM Do, YYYY") }}
				{% endif %}
				{% if data.entry.author %}
					by {{ data.entry.author.name.first }}
				{% endif %}
			</h5>
		</header>

		<div class="post brick">
			<div class="row">
				<div class="split">
					{% if data.entry.languages and data.entry.languages.length %}
						<h2>Languages / Tools Worked On</h2>
						{% for lang in data.entry.languages %}
							<a href="/journal/{{ lang.key }}">{{ lang.name }}</a>
							{% if loop.index < data.entry.languages.length - 1 %}, {% endif %}
						{% endfor %}
					{% endif %}
				</div>
				<div class="split">
					{% if data.project.links.github %}
						<h2>See my progress on this project:</h2>
						<a href="{{ data.project.links.github }}" class="btn">GitHub</a>
					{% else %}
						<p>&nbsp;</p>
					{% endif %}
				</div>
			</div>
			<h2>What I Did Today:</h2>
			{{ data.entry.description | raw }}
		</div>
		{% endif %}
	</div>
{% endblock %}
