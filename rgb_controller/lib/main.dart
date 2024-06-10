import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_controller/src/bloc/shade/shade_bloc.dart';
import 'package:rgb_controller/src/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShadeBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(
      
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
