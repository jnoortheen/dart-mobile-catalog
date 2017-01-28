import 'package:redstone/redstone.dart' as app;
import 'package:redstone_mapper/plugin.dart';
import 'package:redstone_mapper_mongo/manager.dart';

// JSON services
@app.Install(urlPrefix: "/services")
import "package:dart_mobile_catalog/server/item_service.dart";

/// return the home page
@app.Route("/")
index() {
  return "index.html";
}

class Config {
  String dbUrl = "mongodb://localhost/mobi_catalog_db";
}

main() {
  app.setupConsoleLog();

  Config config = new Config();

  MongoDbManager dbManager = new MongoDbManager(config.dbUrl, poolSize: 3);
  app.addPlugin(getMapperPlugin(dbManager, "/services/.+"));

  app.start();
}
