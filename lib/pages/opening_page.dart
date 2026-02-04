import 'package:flutter/material.dart';
import 'package:flutter_prototype/pages/Main_page.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.openingbgColor,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(45),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // Image
              Image.asset(
                "assets/icons/lk_ikon_cirkel.png",
                height: 280,
                width: 280,
              ),

              SizedBox(height: AppSizes.spacing),

              // Title
              const Text(
                "Velkommen til låneklar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.openingTextColor,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              Text(
                "Find din bank og få dit lån nu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.openingTextColor.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 38),

              // Button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainPage()),
                  );
                },

                child: Container(
                  height: 70,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: AppColors.openingButtonColor,
                    borderRadius: BorderRadius.circular(10),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: const Text(
                    "Kom i gang",
                    style: TextStyle(
                      color: AppColors.openingButtonTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.h3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
