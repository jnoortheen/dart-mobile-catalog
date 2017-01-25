library service_test;

import 'package:test/test.dart';
import 'package:redstone/redstone.dart' as app;
import 'package:dart_mobile_catalog/server/item_service.dart';

main() {
  // Load handlers in 'services' library
  setUp(() => app.redstoneSetUp([#item_service]));

  // Remove all loaded handlers
  tearDown(() => app.redstoneTearDown());

  var data = {"k1": "v1", "k2": "v2"};

  test("create new item", () {
    var req = new app.MockRequest(
        "/item", method: app.PUT, bodyType: app.JSON, body: data);
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals("item updated"));
    });
  });

  test("edit item", () {
    var req = new app.MockRequest(
        "/item", method: app.PUT, bodyType: app.JSON, body: data);
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals("item updated"));
    });
  });

  test("delete item", () {
    var req = new app.MockRequest(
        "/item", method: app.DELETE, bodyType: app.JSON, body: data);
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals("deleted"));
    });
  });
}