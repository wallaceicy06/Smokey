import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    invalidate: function() {
      this.get('session').invalidate();
    }
  }
});
