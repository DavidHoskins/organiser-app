import 'package:flutter/material.dart';
import 'dart:math';

class FinancesPage extends StatefulWidget
{
  _FinancesPageState createState() => _FinancesPageState();
}

class _FinancesPageState extends State<FinancesPage>
{
  Widget build(BuildContext context)
  {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index)
        {
          if(index == 0)
            return _getFirstElement(context);

          var rng = new Random();
          return _getFinanceElementText(context, (((rng.nextDouble() * 100) - 50) * 100).toInt().toDouble() / 100);
        }
    );
  }

  //Returns the balance amount at the top of the screen.
  Widget _getFirstElement(BuildContext context)
  {
    return Card
      (
        child:
        Column
          (
          children: <Widget>
          [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text("Remaining Daily Allowance"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text("£0.00"),
              ),
            ),
          ],
        )
    );
  }

  //Returns a text element from the input finance value
  Widget _getFinanceElementText(BuildContext context, double value)
  {
    if(value > 0)
      return Card(child: Text("£${value.toString()}", style: TextStyle(color: Colors.green)));
    else
      return Card(child: Text("£${value.toString()}", style: TextStyle(color: Colors.red)));
  }
}
