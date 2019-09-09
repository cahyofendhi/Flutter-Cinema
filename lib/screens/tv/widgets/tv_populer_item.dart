import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';



class TvPopulerItem extends StatelessWidget {

  final index;
  final imageHeight;

  TvPopulerItem(this.index, this.imageHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Container(
                height: imageHeight,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: Offset(1.09, 5.0),
                        blurRadius: 4.0),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    index % 2 == 0 ? 'assets/images/sample_3.png' : 'assets/images/sample_5.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AppStyle.textTitleBoldItem(
                '(Avanger) : Start War The Last kingdom on the world',
                AppStyle.getColor(ThemeColor.blackText),
                3,
              )
            ],
          );
  }
}