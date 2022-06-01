import 'package:flutter/material.dart';

class Screens extends StatelessWidget {
  final String title;
  const Screens({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      )),
    );
  }
}
