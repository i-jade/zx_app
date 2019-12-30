import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Hello",
        style: Theme.of(context).textTheme.title,
       ),
    );
  }

  Widget hehe(){
    return Column(
      children: <Widget>[
        Text("hehe",style: Theme.of(context).textTheme.subhead,),//注意title，
        Text("hehe",style: Theme.of(context).textTheme.subtitle,) //注意title，

      ],
    );
  }
}