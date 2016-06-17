var keystone = require('keystone');
var Types = keystone.Field.Types;
var Base = require('./Base');

/** 
 * Page Model
 **/

var Page = new keystone.List('Page', { inherits: Base });

Page.add({
	author: { type: Types.Relationship, ref: 'User', index: true },
	content: {
		brief: { type: Types.Html, wysiwyg: true, height: 150 },
		extended: { type: Types.Html, wysiwyg: true, height: 400 }
	}
});

Page.schema.virtual('content.full').get(function () {
	return this.content.extended || this.content.brief;
});

Page.defaultColumns = 'title, state|20%, author|20%';
Page.schema.statics.view_name = 'page';
Page.register();
