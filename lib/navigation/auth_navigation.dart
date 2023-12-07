import 'dart:developer' as developer;
import 'package:auth_nav/bloc/auth_navigation_bloc.dart';
import 'package:auth_nav/bloc/auth_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef InitializeApp = Future<AuthNavigationState> Function(
    BuildContext context);

class AuthNavigation extends StatefulWidget {
  static const ROUTE_NAME = 'AuthNavigation';
  final Widget splashScreen; // isLogin, Config[]
  final WidgetBuilder authorizedBuilder; //Home -> .. ->
  final WidgetBuilder
      unAuthorizedBuilder; //Navigator[Login, Register, ForgotPass, OTP]
  final WidgetBuilder? maintenanceBuilder;
  final WidgetBuilder? guestBuilder; //Home -> .. ->
  final ValueWidgetBuilder<Object?>?
      errorBuilder; //Error when start application -> .. ->

  AuthNavigation({
    required this.splashScreen,
    required this.authorizedBuilder,
    required this.unAuthorizedBuilder,
    this.guestBuilder,
    this.maintenanceBuilder,
    this.errorBuilder,
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
    return BlocBuilder<AuthNavigationBloc, AuthNavigationState>(
      bloc: context.read<AuthNavigationBloc>(),
      builder: (context, state) {
        if (state is LoadConfig) {
          return widget.splashScreen;
        } else if (state is Authorized) {
          return widget.authorizedBuilder(context);
        } else if (state is UnAuthorized) {
          return widget.unAuthorizedBuilder(context);
        } else if (state is Maintenance) {
          if (widget.maintenanceBuilder != null) {
            return widget.maintenanceBuilder!(context);
          }
        } else if (state is GuestMode) {
          if (widget.guestBuilder != null) {
            return widget.guestBuilder!(context);
          }
        } else if (state is ErrorStart) {
          if (widget.errorBuilder != null) {
            return widget.errorBuilder!(context, state.error, null);
          }
        }
        return Container();
      },
      buildWhen: (stateOld, stateCurrent) {
        return stateOld.runtimeType != stateCurrent.runtimeType;
      },
    );
  }
}
