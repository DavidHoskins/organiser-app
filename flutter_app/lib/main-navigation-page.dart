import 'package:flutter/material.dart';

import 'calendar-page.dart';
import 'finances-page.dart';

class MainNavigationPage extends StatefulWidget
{
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage>
{
  int _selectedIndex = 0;

  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Organiser App")),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar
        (
        items: const <BottomNavigationBarItem>
          [
            BottomNavigationBarItem
              (
              icon: Icon(Icons.calendar_today),
              title: Text("Calendar")
            ),
          BottomNavigationBarItem
            (
            icon: Icon(Icons.monetization_on),
            title: Text("Finances"),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      )
    );
  }

  Widget _getBody()
  {
    switch(_selectedIndex)
    {
      case 0:
        return CalendarPage();
      case 1:
        return FinancesPage();
    }

    return Text("ERROR");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
