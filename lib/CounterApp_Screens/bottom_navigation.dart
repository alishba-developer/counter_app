import 'package:counter_app/Auth_Screens/login_screen.dart';
import 'package:counter_app/Auth_Screens/signup_screen.dart';
import 'package:counter_app/CounterApp_Screens/counter_screen.dart';
import 'package:flutter/material.dart';


class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectIndex = 0;

  final List<Widget> _pages = [
    CounterScreen(),
    LoginScreen(),
    SignupScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(

          ),
          currentIndex: _selectIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',

              icon: Icon(Icons.home,color: Colors.white,),
            ),
            BottomNavigationBarItem(
              label: 'About US',
              icon: Icon(Icons.person,color: Colors.white,),
            ),
            BottomNavigationBarItem(
              label: 'Sign Up',
              icon: Icon(Icons.account_balance,color: Colors.white,),
            ),
          ]),
    );
  }
}