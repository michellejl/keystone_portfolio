var keystone = require('keystone');
var Types = keystone.Field.Types;
var Base = require('./Base');


/**
 * Project Model
 * ==========
 */

var Project = new keystone.List('Project', { inherits: Base });

Project.add({
	author: { type: Types.Relationship, ref: 'User', index: true },
	image: { type: Types.CloudinaryImage },
	codePen: { type: Types.Html, wysiwyg: true, height: 150},
	links: {
		github: { type: String },
		demo: { type: String }
	},
	description: { type: Types.Html, wysiwyg: true, height: 150 },
	userStories: { type: Types.Html, wysiwyg: true, height: 150 },
	languages: { type: Types.Relationship, ref: 'Language', many: true }
});



Project.defaultColumns = 'title, state|20%, publishedDate|20%';
Project.schema.statics.view_name = 'project';
Project.register();
