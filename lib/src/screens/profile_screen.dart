import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import '../widgets/options_list_profile.dart';

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProfileCard(
          fullName: "Samfan",
          phoneNo: "+91-8129127294",
        ),
       OptionList(),
      
      ],
    );
  }
}