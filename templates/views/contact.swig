{% extends "../layouts/default.swig" %}

{% block intro %}
	<div class="container">
		<h1>Contact Me</h1>
	</div>
{% endblock %}

{% block content %}
	<div class="container post">
		{% if enquirySubmitted %}
			<h3>Thanks for getting in touch.</h3>
		{% else %}
			<div class="row">
				<div class="brick split">
					<h2>Send Me a Note:</h2>
					<form method="post">
						<input type="hidden" name="action" value="contact">
						{% set className = "" %}
						{% if validationErrors.name %}
							{% set className = "has-error" %}
						{% endif %}
						<div class="form-group {{ className }}">
							<label>
								<span>Name</span>
								<input type="text" name="name.full" value="{{ formData['name.full'] | default('') }}" class="form-control">
							</label>
						</div>
						{% set className = "" %}
						{% if validationErrors.email %}
							{% set className = "has-error" %}
						{% endif %}
						<div class="form-group {{ className }}">
							<label>
								<span>Email</span>
								<input type="email" name="email" value="{{ formData.email | default('') }}" class="form-control">
							</label>
						</div>
						<div class="form-group">
							<label>
								<span>Phone</span>
								<input type="text" name="phone" value="{{ formData.phone | default('') }}" placeholder="(optional)" class="form-control">
							</label>
						</div>
						{% set className = "" %}
						{% if validationErrors.enquiryType %}
							{% set className = "has-error" %}
						{% endif %}
						<!---
						<div class="form-group {{ className }}">
							<label>
								<span>What are you contacting us about?</span>
								<select name="enquiryType" class="form-control">
									<option value="">(select one)</option>
									{% for type in enquiryTypes %}
										{% set selected = "" %}
										{% if formData.enquiryType === type.value %}
											{% set selected = " selected" %}
										{% endif %}
										<option value="{{ type.value }}"{{ selected }}>{{ type.label }}</option>
									{% endfor %}
								</select>
						</div>
						--->
						{% set className = "" %}
						{% if validationErrors.message %}
							{% set className = "has-error" %}
						{% endif %}
						<div class="form-group {{ className }}">
							<label>
								<span>Message</span>
						<textarea name="message" placeholder="Leave us a message..." rows="4" class="form-control">
							{{ formData.message }}
						</textarea>
							</label>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">Send</button>
						</div>
					</form>
				</div>
				<div class="brick split">
					<h2>Let's Get Social:</h2>
					<ul class="social">
						<li>
							<a href="mailto:michellejl@live.com">
								<i class="fa fa-envelope-o" aria-hidden="true"></i>
								michellejl@live.com
							</a>
						</li>
						<li>
							<a href="https://github.com/michellejl/" target="_blank">
								<i class="fa fa-github" aria-hidden="true"></i>
								GitHub.com/MichelleJL
							</a>
						</li>
						<li>
							<a href="https://www.linkedin.com/in/michellejl" target="_blank">
								<i class="fa fa-linkedin-square" aria-hidden="true"></i>
								Linkedin.com/in/MichelleJL
							</a>
						</li>
					</ul>
				</div>
				
			</div>
		{% endif %}
	</div>
{% endblock %}
