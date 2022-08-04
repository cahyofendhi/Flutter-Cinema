import 'package:cinema_flt/components/widgets/shimmer_content.dart';
import 'package:flutter/material.dart';

class CastItemPlaceholder extends StatelessWidget {
  const CastItemPlaceholder({
    Key? key,
    required this.leftMargin,
  }) : super(key: key);

  final double leftMargin;

  @override
  Widget build(BuildContext context) {
    return ShimmerContent(
      Container(
        width: 100,
        child: Padding(
          padding:
              EdgeInsets.only(left: leftMargin, bottom: 5, right: 5, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black45),
                width: 80,
                height: 80,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black45),
                width: 50,
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
