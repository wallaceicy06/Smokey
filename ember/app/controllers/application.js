import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    invalidateSession: function() {
      this.get('session').invalidate();
    }
  },

  currentUser: function() {
    var that = this;
    this.store.find('user', this.get('session').get('secure').user_id).then(
      function(user) {
        that.set('currentUser', user);
      });
  }.observes('session').property(),
});
