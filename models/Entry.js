var keystone = require('keystone');
var Types = keystone.Field.Types;
var Base = require('./Base');

/** 
 * Entry Model
 */

var Entry = new keystone.List('Entry', { inherits: Base });

Entry.add({
	author: { type: Types.Relationship, ref: 'User', index: true },
	description: { type: Types.Html, wysiwyg: true, height: 150 },
	github: { type: String },
	languages: { type: Types.Relationship, ref: 'Language', many: true }
});

Entry.defaultColumns = 'title, state|20%, publishedDate|20%';
Entry.schema.statics.view_name= 'entry';
Entry.register();
