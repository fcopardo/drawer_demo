import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageData{

  String _name;
  String _location;
  int _stars;

  PageData();

  PageData.newInstance(String aName, String aLocation, int stars){
    setName(aName).setLocation(aLocation).setStars(stars);
  }

  PageData setName(String aName){
    _name = aName;
    return this;
  }

  String getName(){
    return _name;
  }

  PageData setLocation(String aLocation){
    _location = aLocation;
    return this;
  }

  String getLocation(){
    return _location;
  }

  PageData setStars(int stars){
    _stars = stars;
    return this;
  }

  int getStars(){
    return _stars;
  }
}

class MaterialPageTitle extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    materialPageTitle page = materialPageTitle.fromPageData(PageData.newInstance('Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41));
        //..setPageData(PageData.newInstance('Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41));
    return page;
  }

}

abstract class BaseTitle extends State<MaterialPageTitle>{

  PageData _data;

  T setPageData<T extends BaseTitle>(PageData data){
    _data = data;
    setState((){
      actionState();
    });
    return this;
  }

  void actionState();
}

class materialPageTitle extends BaseTitle{

  materialPageTitle();
  materialPageTitle.fromPageData(PageData data){
    _data = data;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    //'Oeschinen Lake Campground',
                    _data.getName(),
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  //'Kandersteg, Switzerland',
                  _data.getLocation(),
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text(_data._stars.toString()),
        ],
      ),
    );
  }

  @override
  void actionState() {
    // TODO: implement actionState
  }
}