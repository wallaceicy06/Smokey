import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    edit: function() {
      this.transitionTo('admin.deck.cards', this.get('model'))
    },

    save: function() {
      var deck = this.get('model');
      deck.save();
    }
  }
});
