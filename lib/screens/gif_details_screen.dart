import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/widgets/gif_details_info.dart';
import 'package:gif_search_test_task/widgets/navbar.dart';

class GifDetailsScreen extends StatelessWidget {
  const GifDetailsScreen({
    super.key,
    required this.gif,
    required this.onBack,
  });

  final Gif gif;
  final VoidCallback onBack;

  String _orUnknown(String value) => value.isEmpty ? 'Unknown' : value;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Navbar(
            title: 'GIF Details',
            onBack: onBack,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    gif.url,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          size: 48,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GIF Information',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Details about this GIF',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Divider(color: theme.colorScheme.outline),

                      const SizedBox(height: 16),

                      GifDetailsInfoRow(
                        label: 'Author',
                        value: _orUnknown(gif.username),
                      ),
                      GifDetailsInfoRow(
                        label: 'Create date',
                        value: gif.createDateTime.isEmpty
                            ? 'Unknown'
                            : gif.createDateTime.toUpperCase(),
                      ),
                      GifDetailsInfoRow(
                        label: 'Source',
                        value: _orUnknown(gif.source),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
