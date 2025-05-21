import 'package:bloc_practice/authentication/presentation/screens/sign_in_screen.dart';
import 'package:bloc_practice/counter/bloc/counter_bloc.dart';
import 'package:bloc_practice/todo/data/local/todo_local_data_source.dart';
import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:bloc_practice/todo/data/repository/todo_repository_impl.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_practice/todo/presentation/screens/todo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/presentation/screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoLocalDataSource.initHive();
  final todoLocalDataSource = TodoLocalDataSource();
  final todoRepository = TodoRepositoryImpl(
    todoLocalDataSource: todoLocalDataSource,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc(), child: const MyApp()),
        BlocProvider(
          create: (_) => TodoBloc(todoRepository),
          child: const MyApp(),
        ),
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
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routes: _buildRoutes,
          home: SafeArea(child: SignInScreen())),
    );
  }

  Map<String, WidgetBuilder> get _buildRoutes => {
    '/signUp': (context) => SignUpScreen(),
  };
}
