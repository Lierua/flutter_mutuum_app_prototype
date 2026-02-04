import 'package:flutter/material.dart';

class AppColors {
  static const Color openingbgColor = topColor;
  static const Color openingTextColor = darkColor;
  static const Color openingButtonColor = contrastColor;
  static const Color openingButtonTextColor = topColor;

  // gradient colors
  static const Color topColor = Color.fromARGB(255, 240, 238, 233);
  static const Color bottomColor = Color.fromARGB(255, 224, 219, 212);

  // Call to Action
  static const Color primeColor = Color.fromARGB(255, 6, 59, 105);
  static const Color contrastColor = Color.fromARGB(255, 255, 171, 46);

  // reached
  static const Color reachedColor = Color.fromARGB(255, 12, 210, 55);
  // positive
  static const Color positiveColor = Color.fromARGB(255, 178, 242, 16);
  // neutral
  static const Color neutralColor = Color.fromARGB(255, 253, 232, 0);
  // negative
  static const Color negativeColor = Color.fromARGB(255, 229, 65, 1);

  // monotones
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color lightColor = Color.fromARGB(255, 121, 124, 130);
  static const Color darkColor = Color.fromARGB(255, 59, 69, 81);

  // menu colors

  static const Color menuBgColor = topColor;
  static const Color defaultColor = lightColor;
  static const Color selectedColor = darkColor;
}

class AppSizes {
  static const double h1 = 30;
  static const double h2 = 26;
  static const double h3 = 20;
  static const double body = 16;
  static const double caption = 12;

  //padding

  static const double bodyPadding = 25;
  static const double boxPadding = 20;
  static const double spacing = 30;
  static const double spacingInside = 15;
}

class AppShadows {
  static const BoxShadow soft = BoxShadow(
    color: AppColors.bottomColor,
    blurRadius: 10,
    offset: Offset(0, 4),
  );

  static const BoxShadow medium = BoxShadow(
    color: AppColors.bottomColor,
    blurRadius: 16,
    offset: Offset(0, 6),
  );
}

////////// TEXT TYPES

class AppTextStyles {
  static const TextStyle sectionTitle = TextStyle(
    fontSize: AppSizes.h3,
    fontWeight: FontWeight.w600,
    color: AppColors.lightColor,
  );

  static const TextStyle pageTitle = TextStyle(
    fontSize: AppSizes.h1,
    fontWeight: FontWeight.w500,
    color: AppColors.darkColor,
  );

  static const TextStyle overTitle = TextStyle(
    fontSize: AppSizes.h2,
    fontWeight: FontWeight.w500,
    color: AppColors.darkColor,
  );

  static const TextStyle pText = TextStyle(
    fontSize: AppSizes.body,
    fontWeight: FontWeight.w400,
    color: AppColors.darkColor,
  );

  static const TextStyle captionText = TextStyle(
    fontSize: AppSizes.caption,
    fontWeight: FontWeight.w500,
    color: AppColors.lightColor,
  );
}


// components

/* Over title
            SizedBox(
              width: 330,
              child: Text(
                "Hvad kan jeg låne for og hvad koster det?",
                style: AppTextStyles.overTitle,
              ),
            ),
             */