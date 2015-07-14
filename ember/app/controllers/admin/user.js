import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    destroy: function() {
      var user = this.get('model');
      user.deleteRecord();
      user.save();
    },

    toggleEdit: function() {
      this.set('isEditing', !this.isEditing);
    },

    save: function() {
      var user = this.get('model');
      user.save();
      this.set('isEditing', false);
    }
  },

  editButtonText: function() {
    return (this.isEditing ? 'Save' : 'Edit');
  }.property('isEditing'),
});
