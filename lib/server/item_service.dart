library item_service;

import 'package:redstone/redstone.dart' as app;


/// Service to create and delete mobile items
@app.Group("/item")
class jsonService {

  /// creates new mobile item
  @app.Route("/")
  newItem() {
    return ["ctgry1", "ctgry2"];
  }

  /// edit a mobile item from the catalog
  @app.Route("/edit/:name", methods: const [app.POST])
  editItem(String itemName) {
    return {"Category": itemName};
  }

  /// deletes a mobile item from the catalog
  @app.Route("/delete/:name", methods: const [app.DELETE])
  delItem(String itemName) {
    return {"Category": itemName};
  }

  _getItem(String name) {
    return {"item ": name};
  }
}
