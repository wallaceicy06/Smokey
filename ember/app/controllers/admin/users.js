import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    create: function() {
      console.log('got here');

      var username = this.get('newUsername');

      if (!username) {
        return false;
      }

      var user = this.store.createRecord('user', {
        username: username
      });

      user.save();

      this.set('newUsername', '');
    }
  },

  notEmpty: function() {
    return this.get('length') !== 0;
  }.property('length'),

  itemController: 'admin.user'
});
