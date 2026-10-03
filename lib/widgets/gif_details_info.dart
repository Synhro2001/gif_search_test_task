
import 'package:flutter/material.dart';

class GifDetailsInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const GifDetailsInfoRow({
    required this.label,
    required this.value,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Text(value))
        ],
      ),
      
    );
  }
}