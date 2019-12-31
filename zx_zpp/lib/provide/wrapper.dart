import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class Wrapper extends StatelessWidget {
  final Widget child ;
  Wrapper({this.child});

  @override
  Widget build(BuildContext context) {
    final initThemeData = ThemeData(
      primaryColor: Colors.blue,
    );
    final initIndex = 4 ;
    return null ;
  }
}