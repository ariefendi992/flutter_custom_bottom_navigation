import 'package:custom_bottom_navigation/cubit/page_cubit.dart';
import 'package:custom_bottom_navigation/pages/home_page.dart';
import 'package:custom_bottom_navigation/pages/setting_page.dart';
import 'package:custom_bottom_navigation/pages/transaction_page.dart';
import 'package:custom_bottom_navigation/pages/wallet_page.dart';
import 'package:custom_bottom_navigation/utils.dart';
import 'package:custom_bottom_navigation/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NOTE: CUSTOM BOTTOM NAVIGATION
    Widget contentMenu(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TranscationPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget bottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 30,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigation(
                index: 0,
                iconUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavigation(
                index: 1,
                iconUrl: 'assets/icon_transaction.png',
              ),
              CustomBottomNavigation(
                index: 2,
                iconUrl: 'assets/icon_wallet.png',
              ),
              CustomBottomNavigation(
                index: 3,
                iconUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              contentMenu(currentIndex),
              bottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
