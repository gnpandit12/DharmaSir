
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter_app/views/ApplicationsScreen.dart';
import 'package:flutter_app/views/OverviewScreen.dart';
import 'package:flutter_app/views/StatusScreen.dart';

TabController _tabController;
int _currentIndex;

int _selectedIndexForBottomNavigationBar = 0;
int _selectedIndexForTabBar = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin{

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'AppBar',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),
          ),
          bottom: TabBar(
              onTap: _onItemTappedForTabBar,
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  text: "Overview",
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Applications",
                )
              ]),
        ),
        body:  Center(child:_selectedIndexForTabBar == 0 ?
        _listOfScreenForBottomNavigationBar.elementAt(_selectedIndexForBottomNavigationBar):
        _listOfScreenForTabBar.elementAt(_selectedIndexForTabBar - 1)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndexForBottomNavigationBar,
          onTap: _onItemTappedForBottomNavigationBar,
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                )
            ),
            BottomNavigationBarItem(
                label: "Search",
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                )
            ),
            BottomNavigationBarItem(
                label: "Account",
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                )
            )
          ],
        ),
      ),
    );
  }

  void _onItemTappedForBottomNavigationBar(int index) {
    setState(() {
      _selectedIndexForBottomNavigationBar = index;
      _selectedIndexForTabBar = 0;
    });
  }


  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index+1;
      _selectedIndexForBottomNavigationBar = 0;
    });
  }


  static List<Widget> _listOfScreenForBottomNavigationBar = <Widget>[
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.account_circle),
  ];


  //2
  static List<Widget> _listOfScreenForTabBar = <Widget>[
    OverviewScreen(),
    StatusScreen(),
    ApplicationScreen()
  ];
}
