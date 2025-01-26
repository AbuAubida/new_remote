import 'package:chat_app/bloc_opserver.dart';
import 'package:chat_app/features/auth/presentation/bussiness_logic/bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/views/register_view.dart';
import 'package:chat_app/injection_container.dart' as dl;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dl.init();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dl.sl<AuthBloc>(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const RegisterView()),
    );
  }
}
