import 'package:etc_sale_portal/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Roboto',
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 1,
        titleTextStyle: TextStyle(
          color: AppColors.textWhiteColor,
          fontSize: AppDimens.size20,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
      ),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      cardColor: const Color.fromRGBO(255, 255, 255, 1),

      // pageTransitionsTheme: PageTransitionsTheme(builders: {
      //   TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
      //   TargetPlatform.android: SlideTransitionBuilder(),
      // }),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppDimens.border),
        ),
        overlayColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.backgroundColor),
        tabAlignment: TabAlignment.fill,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.textBlackColor,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: AppColors.backgroundColor,
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textBlackColor,
          fontSize: 24.sp,
        ),
        displayMedium: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 22.sp,
            letterSpacing: 0.5.sp,
            height: 1.5.sp),
        displaySmall: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 20.sp,
            letterSpacing: 0.5.sp,
            height: 1.5.sp),
        titleLarge: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: AppColors.textBlackColor, fontSize: 18.sp),
        bodyMedium: TextStyle(color: AppColors.textBlackColor, fontSize: 16.sp),
        bodySmall: TextStyle(color: AppColors.textBlackColor, fontSize: 14.sp),
        labelLarge: TextStyle(color: AppColors.grey, fontSize: 16.sp),
        labelMedium: TextStyle(color: AppColors.grey, fontSize: 14.sp),
        labelSmall: TextStyle(color: AppColors.grey, fontSize: 12.sp),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(
                (states) => TextStyle(
              color: AppColors.textWhiteColor,
              fontSize: AppDimens.size16,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.primaryColor,
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.textWhiteColor,
          ),
          overlayColor:
          MaterialStateProperty.resolveWith((states) => AppColors.info),
          shadowColor:
          MaterialStateProperty.resolveWith((states) => AppColors.border),
          shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.border),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(
                (states) => TextStyle(
              color: AppColors.textWhiteColor,
              fontSize: AppDimens.size16,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.textWhiteColor,
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.primaryColor,
          ),
          shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.border),
            ),
          ),
        ),
      ),
    );
  }

  static BoxDecoration decoration = BoxDecoration(
      color: AppColors.componentColor,
      borderRadius: BorderRadius.circular(AppDimens.border),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow.withOpacity(0.5),
          blurRadius: 1,
          spreadRadius: 0.1,
          offset: const Offset(2, 2),
        )
      ]);
  static BoxDecoration backgroundGradient = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[AppColors.primaryColor, AppColors.secondaryColor],
    ),
  );
}
