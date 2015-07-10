import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('students', function() {
    this.route('new');
  });

  this.route('student', { path: '/student/:student_id' }, function() {
    this.route('edit');
  });

  this.route('login');

  this.route('session', function() {
    this.route('validate');
    this.route('invalidate');
  });
  this.route('logout');
});

export default Router;
