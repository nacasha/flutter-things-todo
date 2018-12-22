import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thingstodo/theme/colors.dart';

class MyDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  constraints: BoxConstraints.tightFor(
                    width: 70,
                    height: 70
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(
                      width: 5,
                      color: Color.lerp(kPrimaryColor, Colors.white, 0.5)
                    ),
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
                Text(
                  'Izal Fathoni',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
        ListTile(
          dense: true,
          leading: Icon(FontAwesomeIcons.plus),
          title: Text('New Task'),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: Icon(FontAwesomeIcons.star),
          title: Text('Important'),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: Icon(FontAwesomeIcons.check),
          title: Text('Done'),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: Icon(FontAwesomeIcons.clock),
          title: Text('Later'),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: Icon(FontAwesomeIcons.tags),
          title: Text('Category'),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: Icon(FontAwesomeIcons.cog),
          title: Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: Icon(FontAwesomeIcons.signOutAlt),
          title: Text('Logout'),
          onTap: () {},
        ),
      ],
    );
  }
}
