import 'package:flutter/material.dart';

class baseView extends StatelessWidget {

  var title = "view name";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text(title),
    );
  }

  T setTitle<T extends baseView>(String title){
    this.title = title;
    return this;
  }

}