import Ember from 'ember';

export default Ember.Controller.extend({
  currentUser: Ember.computed.alias('controllers.application.currentUser'),
  needs: ['application']
});
