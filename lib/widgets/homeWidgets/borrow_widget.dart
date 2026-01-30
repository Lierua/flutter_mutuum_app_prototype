import 'package:flutter/material.dart';
import 'package:flutter_prototype/pages/Main_page.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button_second.dart';

class BorrowWidget extends StatelessWidget {
  const BorrowWidget({super.key});

  static const List<String> _optionList = ["Ejer", "Andel", "Sommerhus"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.boxPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppShadows.soft],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Options
          Row(
            children: [
              // Icon circle
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.contrastColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.home, color: Colors.white, size: 35),
              ),

              SizedBox(width: 20),

              // Options over list
              Row(
                children: _optionList.map((option) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteColor,
                        foregroundColor: AppColors.whiteColor,
                        elevation: 0,

                        side: BorderSide(
                          // border
                          color: AppColors.lightColor.withOpacity(0.4),
                          width: 2,
                        ),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.caption,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: AppSizes.spacingInside),

          SizedBox(
            width: 220,
            child: Text(
              "Vi estimerer, at du kan låne op til:",
              style: AppTextStyles.sectionTitle,
            ),
          ),

          SizedBox(height: AppSizes.spacingInside),

          Text("2.500.000 kr.", style: AppTextStyles.pageTitle),

          SizedBox(height: AppSizes.spacingInside),

          //Låne knap
          NavButtonSecond(
            label: "Gå til lån",
            icon: Icons.monetization_on,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const MainPage(initialIndex: 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
