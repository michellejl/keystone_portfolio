{% extends "../layouts/default.swig" %}

{% macro showEntry(entry) %}
	<div class="post" data-ks-editable="editable(user, { list: 'Entry', id: entry.id })">
		<h2>
			<a href="/journal/entry/{{ entry.slug }}">{{ entry.title }}</a>
		</h2>
		<p class="lead text-muted">Posted
			{% if entry.publishedDate %}
				on {{ entry._.publishedDate.format("MMMM Do, YYYY") }}
			{% endif %}
			{% if entry.languages and entry.languages.length %}
				in
				{% for lang in entry.languages %}
					<a href="/journal/{{ lang.key }}">{{ lang.name }}</a>
					{% if loop.index < entry.languages.length - 1 %}, {% endif %}
				{% endfor %}
			{% endif %}
			{% if entry.author %}
				by {{ entry.author.name.first }}
			{% endif %}
		</p>
		{% if entry.image.exists %}
			<img src="{{ entry._.image.fit(160,160) }}" class="img pull-right">
		{% endif %}
		<p>{{ entry.description | safe }}</p>
		{% if entry.userStories %}
			<p class="read-more">
				<a href="/journal/entry/{{ entry.slug }}">Read more...</a>
			</p>
		{% endif %}
	</div>
{% endmacro %}

{% block intro %}
	<div class="container">
		{% set title = "Coding Journal" %}
		{% if data.language %}
			{% set title = data.language.name %}
		{% endif %}
		<h1>{{ title }}</h1>
	</div>
{% endblock %}

{% block content %}
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				{% if filters.language and not data.language %}
					<h3 class="text-muted">Invalid Language.</h3>
				{% else %}
					{% if data.entries.results.length %}
						{% if data.entries.totalPages > 1 %}
							<h4 class="text-weight-normal">Showing 
								<strong>{{ data.entries.first }}</strong>
								to 
								<strong>{{ data.entries.last }}</strong>
								of 
								<strong>{{ data.entries.total }}</strong>
								projects.
							</h4>
						{% else %}
							<h4 class="text-weight-normal">Showing {{ utils.plural(data.entries.results.length, "* entry") }}.</h4>
						{% endif %}
						<div class="blog">
							{% for entry in data.entries.results %}
								{{ showEntry(entry) }}
							{% endfor %}
						</div>
						{% if data.project.totalPages > 1 %}
							<ul class="pagination">
								{% if data.entries.previous %}
									<li>
										<a href="?page={{ data.entries.previous }}">
											<span class="glyphicon glyphicon-chevron-left"></span>
										</a>
									</li>
								{% else %}
									<li class="disabled">
										<a href="?page=1">
											<span class="glyphicon glyphicon-chevron-left"></span>
										</a>
									</li>
                                                                {% endif %}
									{% for p in data.entries.pages %}
										<li class="{% if data.entries.currentPage == p %}active{% endif %}">
											<a href="?page={% if p == "..." %}{% if i %}{{ data.entries.totalPages }}{% else %}1{% endif %}{% else %}{{ p }}{% endif %}">{{ p }}</a>
										</li>
									{% endfor %}
								{% if data.entries.next %}
									<li>
										<a href="?page={{ data.entries.next }}">
											<span class="glyphicon glyphicon-chevron-right"></span>
										</a>
									</li>
								{% else %}
									<li class="disabled">
										<a href="?page={{ data.entries.totalPages }}">
											<span class="glyphicon glyphicon-chevron-right"></span>
										</a>
									</li>
								{% endif %}
							</ul>
						{% endif %}
					{% else %}
						{% if data.language %}
							<h3 class="text-muted">There are no entries in the category {{ data.language.name }}.</h3>
						{% else %}
							<h3 class="text-muted">There are no entries yet.</h3>
						{% endif %}
					{% endif %}
				{% endif %}
			</div>
			{% if data.languages.length %}
			<div class="col-sm-4 col-md-3">
				<h2>Languages</h2>
				<div class="list-group" style="margin-top: 70px;">
					<a href="/journal/" class="{% if not data.language %}active{% endif %} list-group-item">All Languages</a>
					{% for lang in data.languages %}
						<a href="/journal/{{ lang.key }}" class="{% if data.language and data.language.id == lang.id %}active{% endif %} list-group-item">{{ lang.name }}</a>
					{% endfor %}
				</div>
			</div>
			{% endif %}
		</div>
	</div>
{% endblock %}
