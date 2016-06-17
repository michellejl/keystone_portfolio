var keystone = require('keystone');
var Types = keystone.Field.Types;
var Base = require('./Base');

/**
 * Post Model
 * ==========
 */

var Post = new keystone.List('Post', { inherits: Base });

Post.add({
	author: { type: Types.Relationship, ref: 'User', index: true },
	image: { type: Types.CloudinaryImage },
	content: {
		brief: { type: Types.Html, wysiwyg: true, height: 150 },
		extended: { type: Types.Html, wysiwyg: true, height: 400 },
	},
	categories: { type: Types.Relationship, ref: 'PostCategory', many: true },
});

Post.schema.virtual('content.full').get(function () {
	return this.content.extended || this.content.brief;
});

Post.defaultColumns = 'title, state|20%, author|20%, publishedDate|20%';
Post.schema.statics.view_name = 'post';
Post.register();
