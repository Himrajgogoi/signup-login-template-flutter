import 'package:flutter/foundation.dart';

class UserLogin{
  String username;
  String password;

  UserLogin({this.username, this.password});
  Map<String, dynamic> toDatabaseJson()=>{
    "username": this.username,
    "password": this.password
  };
}

class Token{
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String,dynamic> json){
    return Token(
      token: json["token"]
    );
  }
}

class UserSignup{
  String firstname;
  String lastname;
  String username;
  String email;
  String password;

  UserSignup({this.firstname, this.lastname, this.username, this.email, this.password});

  Map<String, dynamic> toDatabaseJson()=>{
    "first_name": this.firstname,
    "last_name": this.lastname,
    "username": this.username,
    "email": this.email,
    "password": this.password
  };
}