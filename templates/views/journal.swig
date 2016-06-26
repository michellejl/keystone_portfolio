{% extends "../layouts/default.swig" %}

{% macro showEntry(entry) %}
	<div class="row brick">
		<h2>
			<a href="/journal/entry/{{ entry.slug }}">{{ entry.title }}</a>
		</h2>
		<div class="thumb">
			{% if entry.languages and entry.languages.length %}
				in
				{% for lang in entry.languages %}
					<a href="/journal/{{ lang.key }}">{{ lang.name }}</a>
				{% endfor %}
			{% endif %}
		</div>
		<div class="post" data-ks-editable="editable(user, { list: 'Entry', id: entry.id })">
			<p class="data">Posted
				{% if entry.publishedDate %}
					on {{ entry._.publishedDate.format("MMMM Do, YYYY") }}
				{% endif %}
			</p>
	
			<p>{{ entry.short | safe }}</p>
			<p class="read-more">
				<a href="/journal/entry/{{ entry.slug }}">Read more...</a>
			</p>
		</div>
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

		{% if data.languages.length %}
			<a href="/journal/" class="skill {% if not data.language %}active{% endif %} list-group-item">All</a>
			{% for lang in data.languages %}
				<a href="/journal/{{ lang.key }}" class="skill {% if data.language and data.language.id == lang.id %}active{% endif %} list-group-item">{{ lang.name }}</a>
			{% endfor %}
		{% endif %}
		
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
			<!---
			<h4 class="text-weight-normal">Showing {{ utils.plural(data.entries.results.length, "* entry") }}.</h4>
			--->
		{% endif %}

		<div class="journal">
			<ul>
				{% for entry in data.entries.results %}
					<li class="block">{{ showEntry(entry) }}</li>
				{% endfor %}
			</ul>
		</div>
		
		
		
		
		<div class="row">
			<div class="col-sm-8 col-md-9">
				
						
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
			
		</div>
	</div>
{% endblock %}
