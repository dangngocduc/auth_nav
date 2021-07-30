import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_navigation_state.dart';

class AuthNavigationBloc extends Cubit<AuthNavigationState> {

  static const TAG = 'AuthBloc';

  AuthNavigationBloc() : super(AuthNavigationState.loadConfig());

  void setState(AuthNavigationState state) {
    emit(state);
  }

  void setAuthorized(bool isAuthorized) {
    emit(isAuthorized ? AuthNavigationState.authorized() : AuthNavigationState.unAuthorized());
  }

}