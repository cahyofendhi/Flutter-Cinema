import 'package:flutter/material.dart';

class RatingResult extends StatelessWidget {
  final rate;

  RatingResult(this.rate);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _getBackgrountRate(rate),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 3,
        ),
        child: Text(
          rate.toString(),
          style: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }

  Color _getBackgrountRate(double rate) {
    if (rate < 5.0) {
      return Colors.red;
    } else if (rate < 6.8) {
      return Colors.yellow;
    } else if (rate < 7.3) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }
}