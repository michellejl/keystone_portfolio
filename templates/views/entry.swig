{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
				<article>
					<p>
						<a href="/journal">&larr; back to the journal</a>
					</p>
					<hr>
					{% if not data.entry %}
						<h2>Invalid Entry.</h2>
					{% else %}
						<header>
							<h1>{{ data.entry.title }}</h1>
							<h5>Posted</h5>
							{% if data.entry.publishedDate %}
								on {{ data.entry._.publishedDate.format("MMMM Do, YYYY") }}
							{% endif %}
							{% if data.entry.languages and data.entry.languages.length %}
								in
								{% for lang in data.entry.languages %}
									<a href="/journal/{{ lang.key }}">{{ lang.name }}</a>
									{% if loop.index < data.entry.languages.length - 1 %}, {% endif %}
								{% endfor %}
							{% endif %}
							{% if data.entry.author %}
								by {{ data.entry.author.name.first }}
							{% endif %}
						</header>
						<div class="post">
							{{ data.entry.description | raw }}

							{% if data.entry.languages and data.entry.languages.length %}
								Languages / Tools Used:
								{% for lang in data.entry.languages %}
									<a href="/portfolio/{{ lang.key }}">{{ lang.name }}</a>
									{% if loop.index < data.entry.languages.length - 1 %} {% endif %}
								{% endfor %}
							{% endif %}
							
						</div>
					{% endif %}
				</article>
			</div>
		</div>
	</div>
{% endblock %}
