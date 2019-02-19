import 'package:flutter/material.dart';
import '../models/decorate_card.dart';

class HomePageBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        CardRow(cards[0], Icons.favorite),
        CardRow(cards[1], Icons.location_on),
        CardRow(cards[2], Icons.search),
        Spacer(),
      ],
    );
  }
}

class CardRow extends StatelessWidget {
  final CardModel cardModel;
  final IconData iconData;
  CardRow(this.cardModel, this.iconData);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: [
          decoratedCard(),
          cardContent(),
          icon(),
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

  Widget icon() {
    //print("Y but y");
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: Icon(
        iconData,
        color: Colors.white,
        size: 92.0,
      ),
    );
  }

  final headerTextStyle = TextStyle(
      color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w600);

  final regularTextStyle = TextStyle(
      color: Colors.white, fontSize: 9.0, fontWeight: FontWeight.w400);

  final subHeaderStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  Widget cardContent() {
    return Container(
      margin: EdgeInsets.fromLTRB(116.0, 19.0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 4.0,
          ),
          Text(
            cardModel.title,
            style: headerTextStyle,
          ),
          Container(
            height: 10.0,
          ),
          Text(
            cardModel.description,
            style: subHeaderStyle,
          ),
        ],
      ),
    );
  }

  Widget alCard() {
    return Container(
      child: cardContent(),
      height: 124.0,
      margin: EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white30,
            blurRadius: 10.0,
          ),
        ],
      ),
    );
  }
}