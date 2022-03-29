import 'package:flutter/material.dart';

class TabBarEx extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class Choice {
  final String? title;
  final IconData? icon;

  const Choice({this.title, this.icon});
}

class _TabBarState extends State<TabBarEx> with SingleTickerProviderStateMixin {
  TabController? _controller;
  List<Choice> _items = const <Choice>[
    const Choice(title: 'CAR', icon: Icons.directions_car),
    const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    const Choice(title: 'BOAT', icon: Icons.directions_boat),
    const Choice(title: 'BUS', icon: Icons.directions_bus),
    const Choice(title: 'TRAIN', icon: Icons.directions_railway),
    const Choice(title: 'WALK', icon: Icons.directions_walk),
  ];

  @override
  void initState() {
    _controller = TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TabBarView Example'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.brown),
                child: Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: TabPageSelector(
                    controller: _controller,
                  ),
                )),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: _items.map((Choice item) {
            return Container(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(item.title!),
                    Icon(
                      item.icon,
                      size: 120.0,
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}
