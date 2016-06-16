var keystone = require('keystone');
var async = require('async');

exports = module.exports = function (req, res) {

	var view = new keystone.View(req, res);
	var locals = res.locals;

	// Init locals
	locals.section = 'portfolio';
	locals.filters = {
		language: req.params.language
	};
	locals.data = {
		projects: [],
		languages: []
	};

	// Load all categories
	view.on('init', function (next) {

		keystone.list('Language').model.find().sort('name').exec(function (err, results) {

			if (err || !results.length) {
				return next(err);
			}

			locals.data.languages = results;
			// Load the counts for each language
			async.each(locals.data.languages, function (language, next) {

				keystone.list('Project').model.count().where('languages').in([language.id]).exec(function (err, count) {
					language.postCount = count;
					next(err);
				});

			}, function (err) {
				next(err);
			});
		});
	});

	// Load the current language filter
	view.on('init', function (next) {

		if (req.params.language) {
			keystone.list('Language').model.findOne({ key: locals.filters.language }).exec(function (err, result) {
				locals.data.language = result;
				next(err);
			});
		} else {
			next();
		}
	});

	// Load the projects
	view.on('init', function (next) {

		var q = keystone.list('Project').paginate({
			page: req.query.page || 1,
			perPage: 10,
			maxPages: 10,
			filters: {
				state: 'published'
			}
		})
			.sort('-publishedDate')
			.populate('author languages');
		
		if (locals.data.language) {
			q.where('languages').in([locals.data.language]);
		}

		q.exec(function (err, results) {
			locals.data.projects = results;
			next(err);
		});
	});

	// Render the view
	view.render('portfolio');
};
