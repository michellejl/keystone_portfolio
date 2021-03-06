var keystone = require('keystone');

exports = module.exports = function (req, res) {

	var view = new keystone.View(req, res);
	var locals = res.locals;

	// Set locals
	locals.section = '/:slug';
	locals.data = {};
	
	// Load data
	view.on('init', function (next) {
		var q = keystone.list('Page').model.findOne({
			state: 'published'
		}).populate('author');
		
		q.exec(function (err, result) {
			locals.data.page = result;
			next(err);
		})
		
	});
	
	// Render the view
	view.render('page');

};
