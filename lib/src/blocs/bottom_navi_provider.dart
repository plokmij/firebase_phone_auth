import 'package:flutter/material.dart';
import 'bottomnavibloc.dart';

class BottomNaviProvider extends InheritedWidget {
  final naviBloc = NaviBloc();

  BottomNaviProvider({Key key, Widget child})
    :super(key: key, child:child);

  bool updateShouldNotify(_) => true;

  static NaviBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(BottomNaviProvider) as BottomNaviProvider).naviBloc;
  }
}