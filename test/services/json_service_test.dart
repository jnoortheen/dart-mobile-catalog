library service_test;

import 'package:test/test.dart';
import 'package:redstone/redstone.dart' as app;
import 'package:dart_mobile_catalog/server/json_service.dart';


main() {
  // Load handlers in 'services' library
  setUp(() => app.redstoneSetUp([#json_service]));

  // Remove all loaded handlers
  tearDown(() => app.redstoneTearDown());

  test("returns all mobile items available", () {
    var req = new app.MockRequest("/items/json");
    return app.dispatch(req).then((resp) {
      expect(resp.statusCode, equals(200));
      expect(resp.mockContent, equals("all mobile items"));
    });
  });

  test("returns all category names", () {
    var req = new app.MockRequest("/items/json/titles");
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals('["ctgry1","ctgry2"]'));
    });
  });

  test("returns only requested category", () {
    var req = new app.MockRequest("/items/json/category/nokia");
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals('{"Category":"nokia"}'));
    });
  });
}