import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/app-theme-variables.dart';

import 'home_page.dart';
import 'borrow_page.dart';
import 'savings_page.dart';
import 'profil_page.dart';

import '../widgets/utilities/navigation_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    // Pages list
    final List<Widget> pages = [
      const HomePage(),
      const BorrowPage(),
      const SavingsPage(),
      const ProfilPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.topColor, AppColors.bottomColor],
          ),
        ),

        child: pages[nav.index],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.menuBgColor,

        currentIndex: nav.index,

        onTap: nav.setIndex,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: AppColors.selectedColor,
        unselectedItemColor: AppColors.defaultColor,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Hjem"),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: "Lån",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.balance),
            label: "Opsparing",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Mig"),
        ],
      ),
    );
  }
}
