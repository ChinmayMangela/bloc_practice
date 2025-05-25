import 'package:bloc_practice/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_bloc.dart';
import 'package:bloc_practice/authentication/presentation/screens/auth_gate.dart';
import 'package:bloc_practice/authentication/presentation/screens/email_verification_screen.dart';
import 'package:bloc_practice/authentication/presentation/screens/sign_in_screen.dart';
import 'package:bloc_practice/counter/bloc/counter_bloc.dart';
import 'package:bloc_practice/firebase_options.dart';
import 'package:bloc_practice/todo/data/local/todo_local_data_source.dart';
import 'package:bloc_practice/todo/data/repository/todo_repository_impl.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_practice/todo/presentation/screens/todo_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/data/repository/auth_repository_impl.dart';
import 'authentication/presentation/screens/forgot_password_screen.dart';
import 'authentication/presentation/screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await TodoLocalDataSource.initHive();
  final todoLocalDataSource = TodoLocalDataSource();
  final todoRepository = TodoRepositoryImpl(
    todoLocalDataSource: todoLocalDataSource,
  );

  final firebaseAuth = FirebaseAuth.instance;
  final authRemoteDataSource = AuthRemoteDataSource(firebaseAuth: firebaseAuth);
  final authRepository = AuthRepositoryImpl(
    authRemoteDataSource: authRemoteDataSource,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc(), child: const MyApp()),
        BlocProvider(
          create: (_) => TodoBloc(todoRepository),
          child: const MyApp(),
        ),
        BlocProvider(create: (_) => AuthBloc(authRepository: authRepository)),
      ],
      child: const MyApp(),
    ),
  );
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routes: _buildRoutes,
        home: SafeArea(child: AuthGate()),
      ),
    );
  }

  Map<String, WidgetBuilder> get _buildRoutes => {
    '/signUp': (context) => SignUpScreen(),
    '/forgotPassword': (context) => ForgotPasswordScreen(),
    '/todoHome': (context) => TodoHomeScreen(),
    '/signIn': (context) => SignInScreen(),
    '/emailVerification': (context) => EmailVerificationScreen(),
  };
}
