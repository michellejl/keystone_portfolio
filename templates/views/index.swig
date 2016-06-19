{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="brick" id="intro">
					<h2>Hello World!</h2>
					<p>I am a creative web developer with an art and design background. I have a diverse skill set and unique experiences that drives me to adapt quickly to a variety of situations. I am always ready to learn the next thing, and have a passion for sharing what I know with others. Nothing makes me more excited than immersing myself in a good challenge or a good book.</p>
				</div>
			</div>
			<div class="row">
				<div class="brick" id="intro-portfolio">
					<img src="https://s3.amazonaws.com/StartupStockPhotos/uploads/46.jpg" />
					<h2>Portfolio</h2>
					<p>Some projects are still in progress, and others are complete. All of them taught me new things and encouraged me to continue to grow. I have used a variety of languages, frameworks, and tools to complete these projects. </p>
					<a href="/portfolio" class="btn">View Projects</a>

				</div>
				<div class="brick" id="intro-journal">
					<img src="https://s3.amazonaws.com/StartupStockPhotos/uploads/20160503/5.jpg" />
					<h2>Journal</h2>
					<p>Currently participating in the #100DaysOfCode Challenge as a way to keep myself motivated to create new things every day. Checkout my daily journal to keep track of my progress and get a preview of projects that I am working on.</p>
					<a href="/journal" class="btn">Track Progress</a>
				</div>
			</div>
			
		</div>
	</div>
{% endblock %}
