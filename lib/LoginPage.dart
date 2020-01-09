import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:sales/BottomNavigation.dart';
import 'Http/APIurls.dart';
import 'Http/Request.dart';

import 'Home.dart';

const users = const {

  'wael': '120',
  'wael120120@gmail.com': '120',
  'wael@gmail.com': '120',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {


  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) async{

    if (data.name =='' || data.password =='')
      return 'Email or password is empty';


    int id =await login(data.name ,data.password);




  //  print('Name: ${data.name}, Password: ${data.password}');
    print(id.toString());
  //  return Future.delayed(loginTime).then((_) {
      if (id ==-1) {
        return 'Email or Password does not match';
      }
      else
        {
          user_id =id;
          return null;
        }

    //});
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  String _mail(String name) {
    return null;
  }
  String _pass(String name) {
    return null;
  }


  @override
  Widget build(BuildContext context) {

    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );


    return FlutterLogin(
      passwordValidator: _pass,
      emailValidator: _mail,
        title: '',
        logo: 'images/itos.png',
        onLogin: _authUser,
        onSignup: _authUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => navbar(),
          ));
        },
        onRecoverPassword: _recoverPassword,


        theme: LoginTheme(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.grey,
          errorColor: Colors.redAccent,


        )
    );

  }
}