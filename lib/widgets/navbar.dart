
import 'package:flutter/material.dart';
import 'package:gif_search_test_task/constants/app_color.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    required this.title,
    this.isDarkMode = false,
    this.onToggleTheme,
    this.onBack,
    this.subtitle,
    super.key,
  });

  final String title;
  final bool isDarkMode;
  final VoidCallback? onToggleTheme;
  final VoidCallback? onBack;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final showBackButton = onBack != null;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Row(
          children: [
            if (showBackButton)
              IconButton(
                onPressed: onBack,
                tooltip: 'Go back',
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: theme.colorScheme.onSurface,
                ),
              )
            else
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

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (subtitle != null && !showBackButton) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            if (showBackButton == false && onToggleTheme != null)
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.darkButtonBackground
                      : AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: onToggleTheme,
                  tooltip: isDarkMode
                      ? 'Switch to light theme'
                      : 'Switch to dark theme',
                  icon: Icon(
                    isDarkMode
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    color: isDarkMode
                        ? AppColors.darkButtonIcon
                        : AppColors.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
