part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable{
  const SignupEvent();
}

class SignupButtonPressed extends SignupEvent {
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String password;

  const SignupButtonPressed({@required this.firstname,
    @required this.lastname,
    @required this.username,
    @required this.email,
    @required this.password});

  @override
  List<Object> get props => [firstname, lastname, username, email, password];

  @override
  String toString() => "SignupButtonPressed {firstname: $firstname, lastname: $lastname, username: $username, email: $email, password: $password}";
}
