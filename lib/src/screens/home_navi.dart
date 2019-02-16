import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        optionRow(Icons.favorite),
        optionRow(Icons.location_on),
        optionRow(Icons.search),
        Spacer(),
      ],
    );
  }

  Widget optionRow(IconData ico) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: [
          decoratedCard(),
          icon(ico),
        ],
      ),
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

  Widget icon(IconData ico) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: Icon(
        ico,
        color: Colors.white,
        size: 92.0,
      ),
    );
  }

/*
  Widget cardContent = new Container(
    margin: EdgeInsets.fromLTRB(30.0, 16.0, 16.0, 16.0),
    constraints: BoxConstraints.expand(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 4.0,),

      ],
    ),
  );
  */
}
