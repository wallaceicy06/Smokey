import Ember from 'ember';

var serviceUrl = "http://localhost:4200/session/invalidate";

export default Ember.Route.extend({
  redirect: function() {
    window.location.replace("https://netid.rice.edu/cas/logout?service=" + serviceUrl);
  }
});
