{% import "../mixins/flash-messages.swig" as FlashMessages %}

<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<title>{{ title|default("MichelleJL Portfolio") }}</title>
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		
		<!-- Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Josefin+Slab:400,700|Maven+Pro' rel='stylesheet' type='text/css'>
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		{# Customise the stylesheet for your site by editing /public/styles/site.sass #}
		<link href="/styles/site.css" rel="stylesheet">

		{# This file provides the default styling for the KeystoneJS Content Editor #}
		{%- if user and user.canAccessKeystone -%}
			<link href="/keystone/styles/content/editor.min.css" rel="stylesheet">
		{%- endif -%}

		{# HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries
		   Safely remove this block if you are not targeting IE8 #}
		<!--[if lt IE 9]>
			<script src="//cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.js"></script>
			<script src="//cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		{# Include template-specific stylesheets by extending the css block #}
		{%- block css %}{% endblock -%}

		{# Add any other template-specific HEAD tags by extending the head block #}
		{%- block head %}{% endblock %}
	</head>
	<body>
		<div id="main">
			{# HEADER #}
			<div id="header">
				<header>
					<h1><a href="/">Michelle J. Levine</a></h1><br />
					<h2>Web Developer</h2><br />
					<span class="contact-item">
						<a href="mailto:michellejl@live.com">michellejl@live.com</a>
					</span>
					<span class="contact-item">
						<a href="https://github.com/michellejl" target="_blank">github.com/michellejl</a>
					</span>
					<span class="contact-item">
						<a href="https://www.linkedin.com/in/michellejl" target="_blank">linkedin.com/in/michellejl</a>
					</span>
				</header>
				
				
				{# Customise your site"s navigation by changing the navLinks Array in ./routes/middleware.js
				   ... or completely change this header to suit your design. #}
				<div role="navigation" class="navbar">
					<ul class="nav navbar-nav navbar-left">
						{%- for link in navLinks -%}
							{%- set linkClass = '' -%}
							{%- if link.key == section -%}
								{%- set linkClass = ' class="active"' -%}
							{%- endif %}
							<li{{ linkClass | safe }}>
								<a href="{{ link.href }}">{{ link.label }}</a>
							</li>
						{%- endfor %}
					</ul>
				</div>
			</div>
	
			{# BODY #}
			<div id="body">
				{# NOTE:
				   There is no .container wrapping class around body blocks to allow more flexibility in design.
				   Remember to include it in your templates when you override the intro and content blocks! #}
	
				{# The Intro block appears above flash messages (used for temporary information display) #}
				{%- block intro -%}{%- endblock -%}
	
				{# Flash messages allow you to display once-off status messages to users, e.g. form
				   validation errors, success messages, etc. #}
				{{ FlashMessages.renderMessages(messages) }}
	
				{# The content block should contain the body of your template"s content #}
				{%- block content -%}{%- endblock -%}
			</div>
		</div>

		{# FOOTER #}
		<div id="footer">
			<div class="container">
				<div id="left">
					&nbsp;
				</div>
				<div id="center">
					<p>&copy; 2016 MichelleJL</p>
					<p><a href="mailto:michellejl@live.com">michellejl@live.com</a></p>
				</div>
				<div id="right">
					{% if user -%}
						{%- if user.canAccessKeystone -%}
							<a href="/keystone">Open Keystone</a>
						{%- endif -%}
						<a href="/keystone/signout">Sign Out</a>
					{%- else -%}
						<a href="/keystone/signin">Sign In</a>
					{%- endif %}
				</div>
			</div>
		</div>

		{# JAVASCRIPT #}

		{# jQuery 1.11.3 is included by default, and required by both Bootstrap
			and the KeystoneJS Content Editor. If you are not targeting IE8,
			you can upgrade to 2.1.4 (also bundled) for better performance. #}
		<script src="/js/jquery/jquery-1.11.3.min.js"></script>

		{# Customise which Bootstrap javascript files are served by including
			them specifically here, instead of bootstrap-3.3.5.min.js #}
		<script src="/js/bootstrap/bootstrap-3.3.5.min.js"></script>

		{# The KeystoneJS Content Editor provides support for ks-editable data attributes,
			which generate links to edit content for users who can access Keystone #}
		{% if user and user.canAccessKeystone -%}
			<script src="/keystone/js/content/editor.js"></script>
		{%- endif -%}

		{# Add scripts that are globally required by your site here. #}

		{# Include template-specific javascript files by extending the js block #}
		{%- block js -%}{%- endblock -%}
	</body>
</html>
