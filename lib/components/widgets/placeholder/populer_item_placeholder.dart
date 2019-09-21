import 'package:cinema_flt/components/widgets/shimmer_content.dart';
import 'package:flutter/material.dart';

class PopulerItemPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ShimmerContent(
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: screenWidth / 2.7,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black),
              width: 50,
              height: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black),
              width: 100,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
