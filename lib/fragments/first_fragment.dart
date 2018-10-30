import 'package:drawer_demo/fragments/baseView.dart';
import 'package:drawer_demo/widgets/detailPageTitle.dart';
import 'package:drawer_demo/widgets/buttonRow.dart';
import 'package:drawer_demo/widgets/textRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstFragment extends baseView {

  FirstFragment() {
    setTitle("Hello Fragment 1");
  }


  @override
  Widget build(BuildContext context) {
    Widget titleSection = new ListView(
      children: [
        new Image.asset(
          'images/lake.jpg',
          height: 240.0,
          fit: BoxFit.cover,
        ),
        // ...
        MaterialPageTitle(),
        ButtonRowGroup(),
        TextRow()
      ],
    );

    return titleSection;
  }

}