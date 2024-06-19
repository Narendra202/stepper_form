

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_crud_app/screens/dashboard.dart';
import 'package:hive_crud_app/screens/profile_image.dart';
import 'package:hive_crud_app/screens/userlist.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List',style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.pink.shade600,
      ),

      body: ScreenItems[selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.list,
                  text: 'List',
                ),
                // GButton(
                //   icon: Icons.add,
                //   text: 'Add',
                // ),
                GButton(
                  icon: Icons.dashboard,
                  text: 'Dashboard',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),

    )
    );
  }

  List ScreenItems = [
    Center(child: Text('Home',style: TextStyle(fontSize: 30),)),
    EmployeeList(),
    // EmployeeRegistration(),
    // Center(child: Text('Dashboard',style: TextStyle(fontSize: 30),)),
    DashBoardScreen(),
    ProfileScreen()
    // Center(child: Text('Profile',style: TextStyle(fontSize: 30),)),

  ];
}
