import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        optionRow(),
        optionRow(),
        optionRow()
      ],
    );
  }

  Widget optionRow() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: decoratedCard(),
    );
  }

  Widget decoratedCard() {
    return Container(
      height: 124.0,
      decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.white30,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            )
          ]),
    );
  }
}
