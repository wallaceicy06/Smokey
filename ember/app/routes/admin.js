import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  renderTemplate: function() {
    this.render();
    this.render('menu/admin', {
      outlet: 'side-menu',
      into: 'application'
    });
  }
});
