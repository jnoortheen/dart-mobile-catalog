import 'package:redstone/redstone.dart' as app;

// JSON services
@app.Install(urlPrefix: "/services")
import "package:dart_mobile_catalog/server/item_service.dart";

/// return the home page
@app.Route("/")
index() {
  return "index.html";
}

main() {
  app.setupConsoleLog();
  app.start();
}
