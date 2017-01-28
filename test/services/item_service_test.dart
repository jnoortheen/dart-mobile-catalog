library service_test;

import 'dart:async';

import 'package:test/test.dart';
import 'package:redstone/redstone.dart' as app;
import 'package:dart_mobile_catalog/server/item_service.dart';
import 'package:redstone_mapper/mapper_factory.dart';
import 'package:redstone_mapper/mapper.dart';
import 'package:dart_mobile_catalog/models/item.dart';

main() {
  // Load handlers in 'services' library
  setUp(() {
    app.redstoneSetUp([#item_service]);
    bootstrapMapper();
  });

  // Remove all loaded handlers
  tearDown(() => app.redstoneTearDown());

  Item itm = new Item()
    ..brand = "nokia"
    ..flds = [new Fld("user", "mohammed aasir"), new Fld("OS", "Android")];


  test("test models", () async {
    var data = encode(itm);
    print("data ${data} ${decode(data, Item)}");
    var req = new app.MockRequest("/services/json1",
        method: app.PUT, bodyType: app.JSON, body: data);
    app.dispatch(req).then((resp) {
      print("inner");
      print(resp.mockContent);
    });
    return true;
  });

  test("create new item", () {
    var data = encode(itm);
    var req = new app.MockRequest("/services/item",
        method: app.PUT, bodyType: app.JSON, body: data);
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals("item updated"));
    });
  }, skip: "not implemented");

  test("edit item", () {
    var data = encode(itm);
    var req = new app.MockRequest("/item",
        method: app.PUT, bodyType: app.JSON, body: data);
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals("item updated"));
    });
  }, skip: "not implemented");

  test("delete item", () {
    var data = encode(itm);
    var req = new app.MockRequest("/services/item",
        method: app.DELETE, bodyType: app.JSON, body: data);
    return app.dispatch(req).then((resp) {
      expect(resp.mockContent, equals("deleted"));
    });
  }, skip: "not implemented");
}
