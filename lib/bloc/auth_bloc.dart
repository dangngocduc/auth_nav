import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_navigation_state.dart';

class AuthBloc extends Cubit<AuthNavigationState> {

  static const TAG = 'AuthBloc';

  AuthBloc() : super(AuthNavigationState.loadConfig());

  void setState(AuthNavigationState state) {
    emit(state);
  }

  void setAuthorized(bool isAuthorized) {
    if (isAuthorized) {
      emit(AuthNavigationState.authorized());
    } else {
      emit(AuthNavigationState.unAuthorized());
    }
  }

}