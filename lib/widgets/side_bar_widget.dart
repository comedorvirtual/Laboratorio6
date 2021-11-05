import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Historial'),
                ],
              ))
        ],
      ),
    );
  }
}