import Ember from 'ember';
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin, {
  actions: {
    sessionAuthenticationSucceeded:function() {
      this.transitionTo('dashboard');
    },

    sessionInvalidationSucceeded: function() {
      this.transitionTo('index');
    },

    sessionAuthenticationFailed: function() {
      this.transitionTo('unauthorized');
    },

    authorizationFailed: function() {
      this.transitionTo('unauthorized');
    },

    error: function(error) {
      console.log(error);
      if (error.status === 404) {
        this.transitionTo('not-found');
      } else if (error.status === 419) {
        this.transitionTo('logout');
      }
    }
  }
});
