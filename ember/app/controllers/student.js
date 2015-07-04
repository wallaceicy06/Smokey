import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    destroy: function() {
      var student = this.get('model');
      student.deleteRecord();
      student.save();
    },

    toggleEdit: function() {
      this.set('isEditing', !this.isEditing);
    },

    save: function() {
      var student = this.get('model');
      student.save();
      this.set('isEditing', false);
    }
  },

  editButtonText: function() {
    return (this.isEditing ? 'Save' : 'Edit');
  }.property('isEditing'),
});
