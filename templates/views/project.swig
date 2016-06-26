{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<p>
			<a href="/portfolio" class="white">&larr; back to portfolio</a>
		</p>
		{% if not data.project %}
			<h2>Invalid Project.</h2>
		{% else %}
			<header>
				<h1>{{ data.project.title }}</h1><br />
				<h5>Posted
				{% if data.project.publishedDate %}
					on {{ data.project._.publishedDate.format("MMMM Do, YYYY") }}
				{% endif %}
				
				{% if data.project.author %}
					by {{ data.project.author.name.first }}
				{% endif %}
				</h5>
			</header>
						
			<div class="post brick">
				{% if data.project.codePen %}
					{{ data.project.codePen | raw }}
				{% elseif data.project.image.exists %}
					<div class="image-wrap">
						<img src="{{ data.project._.image.fit(750,450) }}" />
					</div>
				{% endif %}
				
				<div class="row">
					<div class="split">
						{% if data.project.languages and data.project.languages.length %}
							<h2>Languages / Tools Used:</h2>
							{% for lang in data.project.languages %}
								<a href="/portfolio/{{ lang.key }}" class="skill">{{ lang.name }}</a>
							{% endfor %}
						{% endif %}
					</div>
					<div class="split">
						<h2>User Stories:</h2>
						{{ data.project.userStories | raw }}
					</div>
				</div>
				
				<h2>Project Description:</h2>
				{{ data.project.description.long | raw }}


				{% if data.project.links.github %}
					<a href="{{ data.project.links.github }}" class="btn" target="_blank">GitHub</a>
				{% endif %}
				{% if data.project.links.demo %}
					<a href="{{ data.project.links.demo }}" class="btn" target="_blank">Demo</a>
				{% endif %}
				
			</div>
			
		{% endif %}
	</div>
{% endblock %}



