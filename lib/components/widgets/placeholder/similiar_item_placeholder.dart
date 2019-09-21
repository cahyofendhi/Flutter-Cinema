import 'package:cinema_flt/components/widgets/shimmer_content.dart';
import 'package:flutter/material.dart';

class SimiliarItemPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerContent(
      GestureDetector(
        onTap: () => {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.8,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black45),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black45),
              width: 80,
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
