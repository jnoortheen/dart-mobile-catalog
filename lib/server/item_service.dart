library item_service;

import 'dart:async';

import 'package:redstone/redstone.dart' as app;
import 'package:redstone_mapper/plugin.dart';
import 'package:redstone_mapper_mongo/service.dart';
import 'package:dart_mobile_catalog/models/item.dart';

/// Service to create and delete mobile items
@app.Group("/item")
@Encode()
class ItemService extends MongoDbService<Item> {
  ItemService() : super("items");

  @app.Route("/json")
  Future<List<Item>> json(String type) {
    return find();
  }

  /// creates/updates a mobile item
  @app.DefaultRoute(methods: const [app.PUT])
  newItem() {
    return "item updated";
  }

  /// deletes a mobile item from the catalog
  @app.DefaultRoute(methods: const [app.DELETE])
  delItem() {
    return "deleted";
  }

  _getItem(String name) {
    return {"item ": name};
  }
}
