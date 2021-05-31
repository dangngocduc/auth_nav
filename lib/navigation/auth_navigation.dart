import 'dart:developer' as developer;
import 'package:auth_nav/bloc/auth_bloc.dart';
import 'package:auth_nav/bloc/auth_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef  InitializeApp = Future<AuthNavigationState> Function(BuildContext context);

class AuthNavigation extends StatefulWidget {
  static const ROUTE_NAME = 'AuthNavigation';
  final Widget splashScreen;// isLogin, Config[]
  final WidgetBuilder authorizedBuilder; //Home -> .. ->
  final WidgetBuilder unAuthorizedBuilder; //Navigator[Login, Register, ForgotPass, OTP]

  AuthNavigation({
    required this.splashScreen,
    required this.authorizedBuilder,
    required this.unAuthorizedBuilder,
  });

  @override
  _AuthNavigationState createState() => _AuthNavigationState();
}

class _AuthNavigationState extends State<AuthNavigation> {
  static const TAG = 'AuthNavigation';

  @override
  void initState() {
    super.initState();
    developer.log('initState', name: TAG);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthNavigationState>(
      bloc: context.read<AuthBloc>(),
      builder: (context, state) {
        if (state is LoadConfig) {
          return widget.splashScreen;
        } else {
          if (state is Authorized) {
            return widget.authorizedBuilder(context);
          } else {
            return widget.unAuthorizedBuilder(context);
          }
        }
      },
      buildWhen: (stateOld, stateCurrent) {
        return stateOld.runtimeType != stateCurrent.runtimeType;
      },
    );
  }
}
