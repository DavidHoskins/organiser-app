import 'package:flutter/material.dart';

import 'calendar-page.dart';

class MainNavigationPage extends StatefulWidget
{
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage>
{
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Organiser App")),
      body: CalendarPage(),
    );
  }
}
