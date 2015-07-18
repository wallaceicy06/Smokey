import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    create: function() {
      var name  = this.get('newName');

      if (!name) {
        return false;
      }

      var deck = this.store.createRecord('deck', {
        name: name
      });

      deck.save();

      this.set('newName', '');
    },
  },

  notEmpty: function() {
    return this.get('length') !== 0;
  }.property('length'),

  itemController: 'admin.deck'

});
