var keystone = require('keystone');

/**
 * Language Model
 * ==================
 */

var Language = new keystone.List('Language', {
	autokey: { from: 'name', path: 'key', unique: true }
});

Language.add({
	name: { type: String, required: true }
});

Language.relationship({ ref: 'Project', path: 'language' });

Language.register();
