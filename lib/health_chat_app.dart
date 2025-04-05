import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/home_screen/home_screen_cubit.dart';
import 'presentation/pages/home_screen.dart';

class HealthChatApp extends StatelessWidget {
  const HealthChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenCubit(),
      child: HomeScreen(),
    );
  }
}
