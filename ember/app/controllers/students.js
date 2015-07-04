import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    create: function() {
      console.log('got here');

      var name = this.get('newName');
      var netid = this.get('newNetId');

      if (!name || !netid) {
        return false;
      }

      var student = this.store.createRecord('student', {
        name: name,
        netid: netid
      });

      student.save();

      this.set('newName', '');
      this.set('newNetId', '');
    }
  },

  notEmpty: function() {
    return this.get('length') !== 0;
  }.property('length'),

  itemController: 'student'
});
