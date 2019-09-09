import 'package:flutter/material.dart';

class UnkownPage extends StatelessWidget {
  static const routeName = '/unknown-page';
  final String pageName;

  UnkownPage(this.pageName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Unkown Page with name : $pageName',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
