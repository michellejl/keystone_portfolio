var keystone = require('keystone');
var Types = keystone.Field.Types;

var Base = new keystone.List('Base', {
	map: { name: 'title' },
	autokey: { path: 'slug', from: 'title', unique: true }
});
Base.add({
	title: { type: String, required: true },
	state: { type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true },
	slug: { type: String, readonly: true },
	publishedDate: { type: Types.Date, index: true, dependsOn: { state: 'published' } }
});
Base.register();

exports = module.exports = Base;  
