

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPopupMenu{
  String title;
  IconData icon;

  CustomPopupMenu({this.title, this.icon});

  List choices = [
    CustomPopupMenu(title: 'Profile', icon: Icons.email),
    CustomPopupMenu(title: 'Logout', icon: Icons.logout),
  ];
}