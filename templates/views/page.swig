{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<header>
			<h1>{{ data.page.title }}</h1>
		</header>
		
		<div class="brick">
			{{ data.page.content | raw }}
		</div>
		
	</div>
{% endblock %}
