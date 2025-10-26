import 'package:flutter/material.dart';

class ImageofGridItem extends StatelessWidget {
  const ImageofGridItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
       image,// 'asset/image/Picture.png',
        fit: BoxFit
            .cover, // Consider using BoxFit.cover for better aspect ratio handling
      ),
    );
  }
}
