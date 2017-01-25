library item_service;

import 'package:redstone/redstone.dart' as app;


/// Service to create and delete mobile items
@app.Group("/item")
class itemService {

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
