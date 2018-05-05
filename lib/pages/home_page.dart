import 'package:drawer_demo/fragments/baseView.dart';
import 'package:drawer_demo/fragments/first_fragment.dart';
import 'package:drawer_demo/fragments/second_fragment.dart';
import 'package:drawer_demo/fragments/third_fragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Fragment 1", Icons.rss_feed),
    new DrawerItem("Fragment 2", Icons.local_pizza),
    new DrawerItem("Fragment 3", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int selectedDrawerIndex = 0;

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment().setTitle("A new title");

      default:
        return new baseView().setTitle("Extra title $pos");
    }
  }
  
  onSelectItem(int index) {
    setState(() => selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == selectedDrawerIndex,
          onTap: () => onSelectItem(i),
        )
      );
    }

    if(Theme.of(context).platform != TargetPlatform.iOS){
      return new Scaffold(
        appBar: getAppBar(new Text(widget.drawerItems[selectedDrawerIndex].title)),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text("John Doe"), accountEmail: null),
              new Column(children: drawerOptions)
            ],
          ),
        ),
        body: getDrawerItemWidget(selectedDrawerIndex),
      );

    }else{


      return new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(items: const <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
            title: const Text('Home'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.conversation_bubble),
            title: const Text('Support'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.profile_circled),
            title: const Text('Profile'),
          ),
        ],

        ),
      );

      /*return new Scaffold(
        appBar: getAppBar(new Text(widget.drawerItems[selectedDrawerIndex].title)),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text("John Doe"), accountEmail: null),
              new Column(children: drawerOptions)
            ],
          ),
        ),
        body: getDrawerItemWidget(selectedDrawerIndex),
      );*/




    }


  }

  T getAppBar<T extends PreferredSizeWidget>(Widget aTitle){
    if(Theme.of(context).platform != TargetPlatform.iOS){
      return AppBar(
        title: aTitle,
      ) as T;
    }else{
      return CupertinoNavigationBar(
        middle: aTitle,
      ) as T;
    }
  }
}
