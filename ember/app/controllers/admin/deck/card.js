import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    destroy: function() {
      var card = this.get('model');
      card.deleteRecord();
      card.save();
    },

    save: function() {
      var card = this.get('model');
      card.save();
    }
  }
});
