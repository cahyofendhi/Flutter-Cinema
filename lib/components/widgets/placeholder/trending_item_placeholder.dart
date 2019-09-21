import 'package:cinema_flt/components/widgets/shimmer_content.dart';
import 'package:flutter/material.dart';

class TredingItemPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth / 4;
    final imageHeight = imageWidth + (imageWidth / 3);

    return ShimmerContent(
      Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.black),
                      width: 150,
                      height: 10,
                    ),
                    SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(color: Colors.black),
                      width: 50,
                      height: 10,
                    ),
                    SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(color: Colors.black),
                      width: 100,
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double format(double n) {
    return n.ceilToDouble();
  }
}
