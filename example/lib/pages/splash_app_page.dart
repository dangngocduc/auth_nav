import 'dart:developer' as developer;
import 'package:auth_nav/navigation/auth_navigation.dart';
import 'package:auth_nav/navigation/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashAppPage extends SplashPage {

  SplashAppPage(InitializeApp initializeApp) : super(initializeApp);

  @override
  _SplashAppPageState createState() {
    return _SplashAppPageState();
  }
}

class _SplashAppPageState extends SplashPageState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
