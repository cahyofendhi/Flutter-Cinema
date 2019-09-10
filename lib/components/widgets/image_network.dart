import 'package:flutter/material.dart';


class ImageNetwork extends StatelessWidget {

  final String imageUrl;

  const ImageNetwork(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/placeholder.png',
        fit: BoxFit.cover,
        image: imageUrl,
      ),
    );
  }
}