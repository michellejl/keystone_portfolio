{% extends "../layouts/default.swig" %}

	
{% macro showProject(project) %}
	<div class="row brick">
		<h2>
			<a href="/portfolio/project/{{ project.slug }}">{{ project.title }}</a>
		</h2>
		<div class="thumb">
			{% if project.image.exists %}
				<img src="{{ project._.image.fit(500,500) }}" class="img"><br />
			{% endif %}
			Skills: 
			{% if project.languages and project.languages.length %}
				{% for lang in project.languages %}
					<a href="/portfolio/{{ lang.key }}">{{ lang.name }}</a>
				{% endfor %}
			{% endif %}
		</div>
		<hr />
		<div class="post" data-ks-editable="editable(user, { list: 'Project', id: project.id })">
			<p class="data">Posted
				{% if project.publishedDate %}
					on {{ project._.publishedDate.format("MMMM Do, YYYY") }}
				{% endif %}
				
			</p>
			
			<p>{{ project.description.short | safe }}</p>
			<p class="read-more">
				<a href="/portfolio/project/{{ project.slug }}" class="btn">Read more...</a>
			</p>
		</div>
		
	</div>
	
{% endmacro %}

{% block intro %}
	<div class="container">
		{% set title = "Portfolio" %}
		{% if data.language %}
			{% set title = data.language.name %}
		{% endif %}
		<h1>{{ title }}</h1>
	</div>
{% endblock %}

{% block content %}
	<div class="container">

		{% if data.languages.length %}
			<a href="/portfolio/" class="skill {% if not data.language %}active{% endif %} list-group-item">All</a>
			{% for lang in data.languages %}
				<a href="/portfolio/{{ lang.key }}" class="skill {% if data.language and data.language.id == lang.id %}active{% endif %} list-group-item">{{ lang.name }}</a>
			{% endfor %}
		{% endif %}
			
		{% if filters.language and not data.language %}
			<h3 class="text-muted">Invalid Language.</h3>
		{% else %}
			{% if data.projects.results.length %}
				{% if data.projects.totalPages > 1 %}
					<h4 class="text-weight-normal">Showing 
						<strong>{{ data.projects.first }}</strong>
						to 
						<strong>{{ data.projects.last }}</strong>
						of 
						<strong>{{ data.projects.total }}</strong>
						projects.
					</h4>
				{% else %}
					<!---
					<h4 class="text-weight-normal">Showing {{ utils.plural(data.projects.results.length, "* project") }}.</h4>
					--->
				{% endif %}
				<div class="portfolio">
					<ul>
						{% for project in data.projects.results %}
							<li class="block">{{ showProject(project) }}</li>
						{% endfor %}
					</ul>
					
				</div>
				{% if data.project.totalPages > 1 %}
					<ul class="pagination">
						{% if data.projects.previous %}
							<li>
								<a href="?page={{ data.projects.previous }}">
									<<
								</a>
							</li>
						{% else %}
							<li class="disabled">
								<a href="?page=1">
									<<
								</a>
							</li>
														{% endif %}
							{% for p in data.projects.pages %}
								<li class="{% if data.projects.currentPage == p %}active{% endif %}">
									<a href="?page={% if p == "..." %}{% if i %}{{ data.projects.totalPages }}{% else %}1{% endif %}{% else %}{{ p }}{% endif %}">{{ p }}</a>
								</li>
							{% endfor %}
						{% if data.projects.next %}
							<li>
								<a href="?page={{ data.projects.next }}">
									>>
								</a>
							</li>
						{% else %}
							<li class="disabled">
								<a href="?page={{ data.projects.totalPages }}">
									>>
								</a>
							</li>
						{% endif %}
					</ul>
				{% endif %}
			{% else %}
				{% if data.language %}
					<h3 class="text-muted">There are no projects in the category {{ data.language.name }}.</h3>
				{% else %}
					<h3 class="text-muted">There are no projects yet.</h3>
				{% endif %}
			{% endif %}
		{% endif %}
	</div>
{% endblock %}
