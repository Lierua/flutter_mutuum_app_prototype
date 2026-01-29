import 'package:flutter/material.dart';
import 'package:flutter_prototype/pages/borrow_page.dart';
import 'package:flutter_prototype/pages/home_page.dart';
import 'package:flutter_prototype/pages/profil_page.dart';
import 'package:flutter_prototype/pages/savings_page.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;

  const MainPage({super.key, this.initialIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;

  // 1️⃣ Create the page list
  final List<Widget> _pages = const [
    HomePage(),
    BorrowPage(),
    SavingsPage(),
    ProfilPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // 2️⃣ Add the tap handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: _pages[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.menuBgColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
