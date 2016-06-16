{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
				<article>
					<p>
						<a href="/portfolio">&larr; back to portfolio</a>
					</p>
					<hr>
					{% if not data.project %}
						<h2>Invalid Project.</h2>
					{% else %}
						<header>
							<h1>{{ data.project.title }}</h1>
							<h5>Posted
							{% if data.project.publishedDate %}
								on {{ data.project._.publishedDate.format("MMMM Do, YYYY") }}
							{% endif %}
							{% if data.project.languages and data.project.languages.length %}
								in
								{% for lang in data.project.langugaes %}
									<a href="/portfolio/{{ lang.key }}">{{ lang.name }}</a>
									{% if loop.index < data.project.languages.length - 1 %}, {% endif %}
								{% endfor %}
							{% endif %}
							{% if data.project.author %}
								by {{ data.project.author.name.first }}
							{% endif %}
							</h5>
						</header>
						<div class="post">
							{% if data.project.image.exists %}
								<div class="image-wrap">
									<img src="{{ data.project._.image.fit(750,450) }}" class="img-responsive">
								</div>
							{% endif %}
							{{ data.project.content.full | raw }}
						</div>
					{% endif %}
				</article>
			</div>
		</div>
	</div>
{% endblock %}
