import 'package:bliss/constants.dart';

import 'Screen/dashboard.dart';
import 'Screen/DetailsPage.dart';
import 'Screen/Diary.dart';
import 'Screen/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarItem{
  IconData icon;
  bool hasNotification;
  CustomAppBarItem({this.icon,this.hasNotification});
}
class NavigationBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<CustomAppBarItem> items;
  final int page;
  NavigationBar({this.onTabSelected,this.items,this.page}){
    assert(this.items.length==4);
  }
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex=0;
  void _updateIndex(int index){
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    _selectedIndex=widget.page;
    List<Widget> items=List.generate(widget.items.length, (int index) {
      return _buildTabIcon(
          index:index,
          item:widget.items[index],
          onPressed:_updateIndex);
    });
    items.insert(items.length>>1,_buildMiddleSeparator());
    return BottomAppBar(
      color: mainColor,
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          mainAxisSize:MainAxisSize.max ,
          children:items,
        ),
      ),
      shape: CircularNotchedRectangle(),
    );
  }
  Widget _buildTabIcon({int index,CustomAppBarItem item,ValueChanged<int> onPressed}){
    return Expanded(child: SizedBox(
      height: 60.0,
      child: Container(
        child: Material(
          //color:Colors.lightBlueAccent ,
          type: MaterialType.transparency,
          child: InkWell(
            onTap: ()=> onPressed(index),
            child: Icon(
              item.icon,
              color: _selectedIndex==index?Colors.white:Colors.white54,
              size: 24.0,
            ),
          ),
        ),
      ),
    ));
  }
  Widget _buildMiddleSeparator(){
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Container(
          //color: Colors.lightBlueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                  height:24.0
              )
            ],

          ),
        ),
      ),
    );
  }
}