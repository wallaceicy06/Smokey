import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    authenticate: function() {
      this.get('session').authenticate('authenticator:custom',
          { ticket: this.get('ticket') });
    }
  },

  queryParams: ['ticket'],
});
