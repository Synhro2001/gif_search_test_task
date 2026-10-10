import 'package:flutter/material.dart';
import 'package:gif_search_test_task/constants/app_color.dart';

import 'screens/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp>createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme(){
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
          outline: AppColors.border
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
        )
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkPrimary,
          surface: AppColors.darkSurface,
          onSurface: AppColors.darkTextPrimary,
          onSurfaceVariant: AppColors.darkTextSecondary,
          outline: AppColors.darkBorder
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.darkSurface,
            foregroundColor: AppColors.darkTextPrimary,
            elevation: 0,        
          )
      ),
      home: HomeScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}


//  build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,

//         scaffoldBackgroundColor: AppColors.background,

//         colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: AppColors.primary,
//           foregroundColor: Colors.white,
//           elevation: 0,
//         )
//       ),

//       home: const HomeScreen(),
//     );
//   }