import Ember from 'ember';

export default Ember.TextField.extend({
  didInsertElement: function() {
    this.$().focus();
  },

  focusOut: function() {
    alert('out!');
  }
});
