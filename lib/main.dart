import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/opening_page.dart';
import 'pages/data_page.dart';
import 'widgets/utilities/navigation_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BorrowData()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OpeningPage(),
      ),
    );
  }
}
