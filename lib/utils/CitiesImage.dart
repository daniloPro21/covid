import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';

class CitiesImage extends StatelessWidget {
  final String imgUrl;
  final String city;

  CitiesImage(this.imgUrl, this.city);

  @override
  Widget build(BuildContext context) {
      return Container(
        width: 150,
        height: 150,
        child: Stack(
          children: <Widget>[
            Container(
                width: 113,
                height: 113,
                child: ClipRRect(
                    borderRadius: new BorderRadius.all(Radius.circular(100.0)),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    ))),
            Container(
              width: 150,
              height: 150,
              child: Align(
                  alignment: Alignment.center,

                  child: BoldText(city,20,kwhite)),
            )
          ],
        ),
      );

  }
}
