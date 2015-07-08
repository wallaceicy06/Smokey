import Ember from 'ember';

var serviceUrl = "http://localhost:4200/session/validate";

export default Ember.Route.extend({
  redirect: function() {
    window.location.replace("https://netid.rice.edu/cas/login?service=" + serviceUrl);
  }
});
