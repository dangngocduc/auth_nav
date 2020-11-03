import 'package:auth_nav/bloc/auth_bloc.dart';
import 'package:auth_nav/bloc/auth_navigation_state.dart';
import 'package:auth_nav/navigation/auth_navigation.dart';
import 'package:example/pages/splash_app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/pages/authorized_page.dart';
import 'package:example/pages/login_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => AuthBloc(),
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: AuthNavigation(
        splashScreen: SplashAppPage((context) async {
          return Future.delayed(Duration(seconds: 2), () => AuthNavigationState.unAuthorized());
        }),
        authorizedBuilder: (context) => AuthorizedPage(),
        unAuthorizedBuilder: (context) => LoginPage(),
      ),
    );
  }
}
