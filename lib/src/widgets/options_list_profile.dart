import 'package:flutter/material.dart';

class OptionList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        buildTile(context, "Contact Details", Icons.smartphone),
        buildTile(context, "Booking History", Icons.history),
        buildTile(context, "Send Feedback", Icons.feedback),
        buildTile(context, "Invite", Icons.supervisor_account),
        buildTile(context, "Notification Preferences", Icons.notification_important),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }

  Widget buildTile(BuildContext context, String title, IconData icon) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(title),
          leading: Icon(icon),
          trailing: Icon(Icons.navigate_next),
        ),
        Divider(
          height: 6.0,
        ),
      ],
    );
  }
}