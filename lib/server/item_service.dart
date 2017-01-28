library item_service;

import 'dart:async';

import 'package:redstone/redstone.dart' as app;
import 'package:redstone_mapper/plugin.dart';
import 'package:redstone_mapper_mongo/service.dart';
import 'package:dart_mobile_catalog/models/item.dart';


import 'package:redstone_mapper/mapper.dart';
import 'package:redstone_mapper_mongo/manager.dart';
import 'package:redstone_mapper_mongo/metadata.dart';

/// Service to create and delete mobile items
@app.Group("/item")
class ItemService extends MongoDbService<Item> {
  ItemService() : super("items");

  ///  dumps all items in json format
  @app.Route("/json")
  Future<List<Item>> json(String type) => find();

  /// creates/updates a mobile item
  @app.DefaultRoute(methods: const [app.PUT])
  Future<Item> newItem(@Decode() Item itm) {
    print(itm);
    return insert(itm).then((_) => itm);
  }

  /// deletes a mobile item from the catalog
  @app.DefaultRoute(methods: const [app.DELETE])
  Future<bool> delItem() async {
    return true;
  }
}
