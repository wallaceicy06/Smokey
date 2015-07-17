import Ember from 'ember';
import Config from '../config/environment';

var serviceUrl = "http://" + Config.ipAddress + "/session/validate";

export default Ember.Route.extend({
  redirect: function() {
    window.location.replace("https://netid.rice.edu/cas/login?service=" + serviceUrl);
  }
});
