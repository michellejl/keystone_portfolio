{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<header>
			<h1>{{ data.page.title }}</h1>
		</header>
		
		{{ data.page.content | raw }}
		
	</div>
{% endblock %}
