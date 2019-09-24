import 'package:flutter/material.dart';

class DatePage extends StatefulWidget
{
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  Widget build(BuildContext context) {
    int position = 0;
    return Scaffold
      (
      appBar: AppBar(title: Text("TESTING")),
      body: ListView.builder
        (
          itemCount: 48,
          itemBuilder: (context, index) {
            if (index % 2 == 0)
              return Divider();

            position++;

            if (position > 12)
              return Ink(
                color: Colors.red,
                child: ListTile
                  (
                  leading: Text(position.toString()),
                ),
              );

            return ListTile
              (
              leading: Text(position.toString()),
            );
          }
      ),
    );
  }
}
