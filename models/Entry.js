var keystone = require('keystone');
var Types = keystone.Field.Types;

/** 
 * Entry Model
 */

var Entry = new keystone.List('Entry', {
	map: { name: 'title' },
	autokey: { path: 'slug', from: 'title', unique: true }
});

Entry.add({
	title: { type: String, required: true },
	state: { type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true },
	author: { type: Types.Relationship, ref: 'User', index: true },
	publishedDate: { type: Types.Date, index: true, dependsOn: { state: 'published' } },
	description: { type: Types.Html, wysiwyg: true, height: 150 },
	github: { type: String },
	languages: { type: Types.Relationship, ref: 'Language', many: true }
});

Entry.defaultColumns = 'title, state|20%, author|20%, publishedDate|20%';
Entry.register();
