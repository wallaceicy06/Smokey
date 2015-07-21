import Ember from 'ember';
import Config from '../config/environment';
import UnauthenticatedRouteMixin from 'simple-auth/mixins/unauthenticated-route-mixin';

var serviceUrl = "http://" + Config.ipAddress + "/session/validate";

export default Ember.Route.extend(UnauthenticatedRouteMixin, {
  redirect: function() {
    window.location.replace("https://netid.rice.edu/cas/login?service=" + serviceUrl);
  }
});
