abstract class  AuthNavigationState {
  factory AuthNavigationState.authorized() {
    return Authorized();
  }
  factory AuthNavigationState.unAuthorized() {
    return UnAuthorized();
  }
  factory AuthNavigationState.loadConfig() {
    return LoadConfig();
  }
}

class Authorized implements AuthNavigationState {}

class UnAuthorized implements AuthNavigationState {}

class LoadConfig implements AuthNavigationState {}
