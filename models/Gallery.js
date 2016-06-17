var keystone = require('keystone');
var Types = keystone.Field.Types;
var Base = require('./Base');

/**
 * Gallery Model
 * =============
 */

var Gallery = new keystone.List('Gallery', { inherits: Base });

Gallery.add({
	heroImage: { type: Types.CloudinaryImage },
	images: { type: Types.CloudinaryImages }
});

Gallery.schema.statics.view_name = 'gallery';
Gallery.register();
