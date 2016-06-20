var keystone = require('keystone');

exports = module.exports = function (req, res) {
	
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	// Set locals
	locals.section = 'journal';
	locals.filters = {
		entry: req.params.entry
	};
	locals.data = {
		entries: []
	};
	
	// Load current entry
	view.on('init', function (next) {
		
		var q = keystone.list('Entry').model.findOne({
			state: 'published',
			slug: locals.filters.entry
		}).populate('author languages');
		
		q.exec(function (err, result) {
			locals.data.entry = result;
			next(err);
		});
		
	});

	// Load other entries
	/*
	view.on('init', function (next) {

		var q = keystone.list('Entry').model.find().where('state', 'published').sort('-publishedDate').populate('author').limit('4');

		q.exec(function (err, results) {
			locals.data.entries = results;
			next(err);
		});

	});
	*/

	// Render the view
	view.render('entry');
	
};

