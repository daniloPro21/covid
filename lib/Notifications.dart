import 'package:flutter/material.dart';
import 'package:covid/utils/TextStyles.dart';
import 'package:covid/utils/consts.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: BoldText("Notifications", 25, Colors.white),
    centerTitle: true,
    elevation: 0.0,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          notification(),
        ],
      ),
    ));
  }

  Padding notification() {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 100,
      child: Card(
        elevation: 10,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText("Info", 20.0, kblack),
                  Icon(Icons.notifications_active,size: 20.0,color: Colors.blue,)
                ],
              ),
              SizedBox(
                          height: 1,
                        ),
              NormalText("Yo!! Mola n'oublie pas de te laver les mains.C'est pour ton bien",kgreyDark,16),
              NormalText("07Mai à 15:30 pm",kdarkBlue,12),


            ],
          ),
        ),
      ),
    ),
  );
  }
}
