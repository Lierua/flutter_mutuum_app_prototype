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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hej Steve",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primeColor,
                  ),
                ),
                SizedBox(height: AppSizes.spacing),

                const BorrowWidget(),

                SizedBox(height: AppSizes.spacing),

                const SavingWidget(),

                SizedBox(height: AppSizes.spacing),

                const ScoreWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
