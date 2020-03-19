import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;

  const ImageNetwork(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => _circleIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _circleIndicator(){
    return Center(
      child: Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(),
      ),
    );
  }

}
