library json_service;

import 'package:redstone/redstone.dart' as app;


/// returns mobile items in the database as a json
@app.Group("/items/json")
class jsonService {

  /// Returns all items without any filters running
  @app.DefaultRoute()
  all() {
    return "all mobile items";
  }

  /// Returns all category titles
  @app.Route("/titles")
  allTitles() {
    return ["ctgry1", "ctgry2"];
  }

  /// Returns items only matching the given category
  @app.Route("/filter/:category")
  withCategory(String category) {
    return {"Category": category};
  }
}
