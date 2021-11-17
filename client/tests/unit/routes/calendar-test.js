import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | calendar', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:calendar');
    assert.ok(route);
  });
});
