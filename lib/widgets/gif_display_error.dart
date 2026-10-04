import 'package:flutter/material.dart';

class GifDisplayError extends StatelessWidget {
  final VoidCallback onRetry;

  const GifDisplayError({
    required this.onRetry,
    super.key
  });

  @override 
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.red.shade200
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 42,
                color: Colors.red.shade600,
              ),
              const SizedBox(height: 12,),

              Text(
                'Something wrong',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),

              ElevatedButton(onPressed: onRetry, child: const Text('Please, try again!'))
            ],
          ),
        ),
      ),
    );
  }
}