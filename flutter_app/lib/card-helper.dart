import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget
{
  Widget leadingElement;
  Widget titleElement;

  MaterialPageRoute pageRoute;

  Widget build(BuildContext context)
  {
    return GestureDetector
      (
      child: Card
        (
        child: ListTile
          (
          leading: leadingElement,
          title: titleElement,
        ),
      ),
      onTap: ()
      {
        Navigator.push
          (
            context,
          pageRoute,
        );
      },
    );
  }
}
