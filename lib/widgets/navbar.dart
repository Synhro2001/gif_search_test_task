import 'package:flutter/material.dart';
import 'package:gif_search_test_task/constants/app_color.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    required this.title,
    required this.isDarkMode,
    required this.onToggleTheme,
    super.key,
  });

  final String title;
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Icon(
                Icons.gif_box_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(width: 14,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Find your next reaction',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14
                    ),
                  )
                ],
              )),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: IconButton(
                  onPressed: onToggleTheme,
                  tooltip: isDarkMode 
                    ? "Switch to light theme" :
                    "Switch to dark theme",
                    style: IconButton.styleFrom(
                      backgroundColor: isDarkMode ? AppColors.darkButtonBackground : AppColors.searchBackground,
                      minimumSize: const Size(44, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  icon: Icon(
                    isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: isDarkMode ? AppColors.darkButtonIcon : AppColors.primary,
                  )
                ),
              )
          ],
        ),
      ),
    );
  }
}