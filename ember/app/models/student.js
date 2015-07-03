import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  netid: DS.attr('string')
}).reopenClass({
  FIXTURES: [
    { id: 1, name: 'Sean Harger', netid: 'ssh2' },
    { id: 2, name: 'Adam Bloom', netid: 'asb7' }
  ]
});
