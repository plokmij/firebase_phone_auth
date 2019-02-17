import 'package:flutter/material.dart';
import 'home_navi.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    print('Am I here?');
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
  }
}
