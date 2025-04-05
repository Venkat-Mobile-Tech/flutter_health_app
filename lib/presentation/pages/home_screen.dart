import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dependency_injection/injection_container.dart';

import '../../core/theme/app_theme.dart';
import '../bloc/home_screen/home_screen_cubit.dart';
import '../bloc/home_screen/home_screen_state.dart';
import '../enums/screen_type.dart';
import '../widgets/navigation_guide_screen.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          BlocBuilder<HomeScreenCubit, HomeScreenState>(
            bloc: serviceLocator<HomeScreenCubit>(),
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: state.currentPage == index ? 40 : 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: state.currentPage == index
                          ? AppTheme.indicatorActiveColor
                          : AppTheme.indicatorInactiveColor,
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                serviceLocator<HomeScreenCubit>().updatePage(index);
              },
              children: [
                const NavigationGuideScreen(type: ScreenType.left),
                ChatScreen(),
                const NavigationGuideScreen(type: ScreenType.right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
