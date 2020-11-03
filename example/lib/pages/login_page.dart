import 'package:auth_nav/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = 'LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Pass Login Success'),
          onPressed: () {
            context.bloc<AuthBloc>().setAuthorized(true);
          },
        ),
      ),
    );
  }
}
