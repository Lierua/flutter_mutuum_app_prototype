import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button_second.dart';
import 'package:flutter_prototype/widgets/utilities/navigation_provider.dart';

class BorrowWidget extends StatelessWidget {
  const BorrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.boxPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppShadows.soft],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vi estimerer, at du kan låne op til:",
            style: AppTextStyles.pageTitle,
          ),

          SizedBox(height: AppSizes.spacingInside),

          Text(
            "2.500.000 kr.",
            style: AppTextStyles.pageTitle.copyWith(fontSize: 40),
          ),
          SizedBox(height: AppSizes.spacing),

          // Only show if NOT on borrow tab
          if (nav.index != 1)
            NavButtonSecond(
              label: "Gå til lån",
              icon: Icons.monetization_on,
              onPressed: () {
                context.read<NavigationProvider>().setIndex(1);
              },
            ),

          if (nav.index == 1)
            Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.contrastColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
