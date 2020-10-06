import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:signup_login_template_v1/bloc/authenticate_bloc.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(left: 30),
              child: Text("Welcome",
              style: TextStyle(
              fontSize: 24.0,
               ),),),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0.0),
              child: Container(
                child: RaisedButton(
                  child: Text(
                    "Logout"
                  ),
                  onPressed: (){
                    BlocProvider.of<AuthenticateBloc>(context).add(LoggedOut());
                  },
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
