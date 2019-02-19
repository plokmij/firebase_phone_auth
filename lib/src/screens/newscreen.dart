import 'package:flutter/material.dart';
import 'home_navi.dart';
import '../blocs/bottom_navi_provider.dart';
import '../blocs/bottomnavibloc.dart';
import 'profile_screen.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final navibloc = NaviBloc();
    return BottomNaviProvider(
      child: StreamBuilder(
        stream: navibloc.currentIndex,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Home',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
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
            body: Align(
              child: snapshot.data == 2 ? ProfileScreen():HomePageBody(),
              alignment: Alignment.center,
            ),
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
