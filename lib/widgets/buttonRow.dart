import 'package:flutter/material.dart';


class ButtonRowGroup extends Container{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButtonRow(Icons.call, 'CALL'),
          MaterialButtonRow(Icons.near_me, 'ROUTE'),
          MaterialButtonRow(Icons.share, 'SHARE'),
        ],
      ),
    );
  }

}

class MaterialButtonRow extends Column{

  IconData icon;
  String label;

  MaterialButtonRow(IconData icon, String label){
    this.icon = icon;
    this.label = label;
  }

  @override
  Widget build(BuildContext context){
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}