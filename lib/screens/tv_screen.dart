import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

class TvScreen extends StatefulWidget {
  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Cinemax'),
      ),
      body: Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.width / 2,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    border: Border.all(
                      width: 2,
                      color: AppStyle.getColor(ThemeColor.grey),
                    ),
                  ),
                  child: Text('search your movie'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
