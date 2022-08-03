import 'package:cinema_flt/components/widgets/shimmer_content.dart';
import 'package:flutter/material.dart';

class SliderItemPlaceholder extends StatelessWidget {
  const SliderItemPlaceholder({
    Key? key,
    required this.contentHeight,
  }) : super(key: key);

  final double contentHeight;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return ShimmerContent(
          Stack(children: <Widget>[
            _imageView(),
            _contentView(contentHeight),
          ]),
        );
      },
    );
  }

  Widget _imageView() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _contentView(double contentHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: contentHeight / 3,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: Colors.black12),
          child: _titleContent(),
        ),
      ],
    );
  }

  Widget _titleContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black),
            width: 100,
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black),
            width: 100,
            height: 5,
          ),
        ],
      ),
    );
  }
}
