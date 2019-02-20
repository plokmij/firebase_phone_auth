import 'package:flutter/material.dart';
import 'home_navi.dart';
import '../blocs/bottom_navi_provider.dart';
import '../blocs/bottomnavibloc.dart';
import 'profile_screen.dart';

class Home extends StatelessWidget {
  static TextStyle appBarTitleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle profileTitleStyle = appBarTitleStyle.copyWith(
    color: Colors.white,
  );
  List<Widget> screens = [ Text('Still Under Development'), HomePageBody(), Text('Stiull UNder Development'), ProfileScreen()];
  List<Text> appBarTitles = [Text('Favorites',style:appBarTitleStyle,), Text('Home',style:appBarTitleStyle,), Text('Alerts',style:appBarTitleStyle,), Text('Profile',style:profileTitleStyle)];
  Widget build(BuildContext context) {
    final navibloc = NaviBloc();
    return BottomNaviProvider(
      child: StreamBuilder(
        stream: navibloc.currentIndex,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: snapshot.data == 3? Colors.black:Colors.white,
              title: snapshot.hasData?appBarTitles[snapshot.data]:appBarTitles[1],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (integer){
                navibloc.changeIndex;
                navibloc.setCurrentIndex(integer);
                print(navibloc.getCurrenIndex());
              },
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.black,
              currentIndex: snapshot.hasData?snapshot.data:1,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), title: Text('Favorites')),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('Alerts'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
              ],
            ),
            body: snapshot.hasData?screens[snapshot.data]:screens[1],
          );
        },
      ),
    );
    /*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Home',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), 
              title: Text('Favorites')),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Alerts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
      ),

      body: Align(
        child: HomePageBody(),
        alignment: Alignment.center,
      ),
    );
    */
  }
}
