import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    create: function() {
      console.log('got here');

      var username = this.get('newUsername');
      var firstName = this.get('newFirstName');
      var lastName = this.get('newLastName');

      if (!username || !firstName || !lastName) {
        return false;
      }

      var user = this.store.createRecord('user', {
        username: username,
        firstName: firstName,
        lastName: lastName
      });

      user.save();

      this.set('newUsername', '');
      this.set('newFirstName', '');
      this.set('newLastName', '');
    }
  },

  notEmpty: function() {
    return this.get('length') !== 0;
  }.property('length'),

  itemController: 'admin.user'
});
