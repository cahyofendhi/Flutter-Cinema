import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

import 'title_category.dart';

class ContainerCategory extends StatelessWidget {
  final title;
  final content;

  ContainerCategory(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TitleCategory(
                title,
                AppStyle.getColor(ThemeColor.blackText),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          content,
        ],
      ),
    );
  }
}
