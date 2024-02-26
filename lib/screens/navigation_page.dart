import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky_task_manager/bloc/navigation_bloc.dart';
import 'package:tasky_task_manager/data_layer/home_data_layer.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: whiteColor,
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  context
                      .read<NavigationBloc>()
                      .add(ChangePageEvent(pageIndex: index));
                },
                currentIndex: locator.currentPageIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: oceanBlueColor,
                unselectedItemColor: greyColor,
                selectedLabelStyle: const TextStyle(
                    fontFamily: urbanistFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: urbanistFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                backgroundColor: whiteColor,
                items: [
                  BottomNavigationBarItem(
                      label: "Todo",
                      activeIcon: Image.asset("assets/icons/list_enabled.png"),
                      icon: Image.asset("assets/icons/list_disabled.png")),
                  BottomNavigationBarItem(
                      label: "Completed",
                      activeIcon: Image.asset("assets/icons/check_enabled.png"),
                      icon: Image.asset("assets/icons/check_disabled.png")),
                ]),
            body: locator.screens[locator.currentPageIndex],
          );
        },
      ),
    );
  }
}
