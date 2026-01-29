import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/homeWidgets/borrow_widget.dart';
import 'package:flutter_prototype/widgets/homeWidgets/saving_widget.dart';
import 'package:flutter_prototype/widgets/homeWidgets/score_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.bodyPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // <-- add this
              children: [
                Center(
                  child: Text(
                    "Velkommen Steve",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppSizes.h1,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primeColor,
                    ),
                  ),
                ),

                SizedBox(height: AppSizes.spacing),

                Text("Oversigt", style: AppTextStyles.pageTitle),
                SizedBox(height: AppSizes.spacingInside),

                BorrowWidget(),

                SizedBox(height: AppSizes.spacing),
                Text("Opsparingsplaner", style: AppTextStyles.overTitle),
                SizedBox(height: AppSizes.spacingInside),

                SavingWidget(),

                SizedBox(height: AppSizes.spacing),
                ScoreWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
