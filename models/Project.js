var keystone = require('keystone');
var Types = keystone.Field.Types;

/**
 * Project Model
 * ==========
 */

var Project = new keystone.List('Project', {
	map: { name: 'title' },
	autokey: { path: 'slug', from: 'title', unique: true }
});

Project.add({
	title: { type: String, required: true },
	state: { type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true },
	author: { type: Types.Relationship, ref: 'User', index: true },
	publishedDate: { type: Types.Date, index: true, dependsOn: { state: 'published' } },
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

Project.schema.virtual('content.full').get(function () {
	return this.content.extended || this.content.brief;
});

Project.defaultColumns = 'title, state|20%, author|20%, publishedDate|20%';
Project.register();
