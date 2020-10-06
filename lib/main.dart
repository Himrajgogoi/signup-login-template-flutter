import 'package:flutter/material.dart';

import "package:bloc/bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:signup_login_template_v1/models/user_model.dart';
import "package:signup_login_template_v1/repository/user_repository.dart";

import "package:signup_login_template_v1/bloc/authenticate_bloc.dart";
import "package:signup_login_template_v1/splash/splash.dart";
import "package:signup_login_template_v1/wrapper.dart";
import "package:signup_login_template_v1/home/home_page.dart";
import "package:signup_login_template_v1/shared/common.dart";


class SimpleBlocObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object event){
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition){
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace){
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticateBloc>(
        create:(context){
          return AuthenticateBloc(userRepository: userRepository)..add(AppStarted());
        },
       child: MyApp(userRepository: userRepository)
    )
  );
}

class MyApp extends StatelessWidget {

  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticateBloc, AuthenticateState>(
        builder: (context, state){
          if(state is AuthenticateUninitialized){
            return SplashPage();
          }
          if(state is AuthenticateAuthenticated){
            return HomePage();
          }
          if(state is AuthenticateUnauthenticated) {
            return Wrapper(userRepository: userRepository);
          }
          if(state is AuthenticateLoading){
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}

