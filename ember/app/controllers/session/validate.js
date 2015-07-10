import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    authenticate: function() {
      this.get('session').authenticate('simple-auth-authenticator:token',
          { identification: this.get('ticket') });
    }
  },

  queryParams: ['ticket'],
});
