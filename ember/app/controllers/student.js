import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    destroy: function() {
      console.log('attempting to destroy a student');
      var student = this.get('model');
      student.deleteRecord();
      student.save();
    }
  }
});
