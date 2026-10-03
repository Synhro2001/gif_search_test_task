import 'package:flutter/material.dart';
import 'package:gif_search_test_task/constants/app_color.dart';
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/widgets/gif_details_info.dart';

class GifDetailsScreen extends StatelessWidget{
  final Gif gif;

  const GifDetailsScreen({
    super.key,
    required this.gif
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(18, 48, 18, 24),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)
              ),
            ),
            child: Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
                const SizedBox(width: 4),
                const Text(
                  'GIF Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    gif.url,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 24,),

                  Text(
                    gif.title.isEmpty ? 'Unknown GIF' : gif.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24,),

                  GifDetailsInfoRow(label: 'Author', value: gif.username.isEmpty ? 'Unknown' : gif.username),
                  GifDetailsInfoRow(label: 'Create date', value: gif.createDateTime.isEmpty ? 'Unknown' : gif.createDateTime.toUpperCase()),
                  GifDetailsInfoRow(label: 'Source', value: gif.source.isEmpty ? 'Unknown' : gif.source),
                ],
              ),
            ),
           ),
        ],
     
      ),
    );
  }

}