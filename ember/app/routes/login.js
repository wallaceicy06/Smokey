import Ember from 'ember';

var serviceUrl = "http://localhost:3000/api/sessions/create";

export default Ember.Route.extend({
  redirect: function() {
    window.location.replace("https://netid.rice.edu/cas/login?service=" + serviceUrl);
  }
});
