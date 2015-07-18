import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    create: function() {
      var name = this.get('newName');
      var capacity = this.get('newCapacity');

      if (!name || !capacity) {
        return false;
      }

      var card = this.store.createRecord('card', {
        name: name,
        capacity: capacity,
        deck: this.get('deck').model
      });

      card.save();

      this.set('newName', '');
      this.set('newCapacity', '');
    }
  },

  needs: 'admin/deck',
  deck: Ember.computed.alias('controllers.admin/deck'),
  itemController: 'admin.deck.card'
});
