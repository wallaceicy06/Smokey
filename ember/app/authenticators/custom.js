import Ember from 'ember';
import Base from 'simple-auth/authenticators/base';

var serviceUrl = "http://localhost:4200/session/invalidate";

export default Base.extend({
  restore(data) {
    return new Ember.RSVP.Promise(function(resolve, reject) {
      Ember.$.ajax({
        url: '/api/session',
        type: 'GET'
      }).success(function(response) {
        resolve({username: response.username});
      }).fail(function() {
        console.log('failed');
        reject();
      });
    });
  },

  authenticate(credentials) {
    return new Ember.RSVP.Promise(function(resolve, reject) {
      Ember.$.ajax({
        url: '/api/sessions',
        type: 'POST',
        data: JSON.stringify(credentials),
        contentType: 'application/json'
      }).success(function(response) {
        resolve({username: response.username});
      }).fail(function() {
        reject();
      });
    });
  },

  invalidate(data) {
    return new Ember.RSVP.Promise(function(resolve) {
      Ember.$.ajax({
        url: '/api/session',
        type: 'DELETE'
      }).then(function() {
        resolve();
        window.location.replace("https://netid.rice.edu/cas/logout?service=" + serviceUrl);
      });
    });
  }
});
