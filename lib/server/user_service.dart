library user_service;

import 'package:redstone/redstone.dart' as app;

/// user management. Enables us to create
/// and validate user login using OAuthService
@app.Group("/user")
class User {
  @app.DefaultRoute(methods: const [app.PUT])
  add() {
    return "siged out";
  }

  @app.DefaultRoute(methods: const [app.POST])
  signout() {
    return "siged out";
  }
}
