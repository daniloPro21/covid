
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:covid/utils/TextStyles.dart';
import 'package:covid/utils/consts.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

 var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

  Future<void> _scheduleNotification() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description',
        icon: 'secondary_icon',
        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        largeIcon: DrawableResourceAndroidBitmap('sample_large_icon'),
        vibrationPattern: vibrationPattern,
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }


  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }

var futureScheduledNotification;

 @override
  void initState() {
    
    super.initState();

    var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initilializationSettingsIOS = new IOSInitializationSettings();

    var initializationSetings = new InitializationSettings(
      initializationSettingsAndroid, initilializationSettingsIOS);

      flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin.initialize(initializationSetings);   

        futureScheduledNotification =  _showNotification();            
   
  }
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
          FutureBuilder(
            future: futureScheduledNotification,
            builder: (context , snapshot)
            {
              if(snapshot.hasData)
              {
                return notification();
              }
              else if(snapshot.hasError)
              {

              }
                    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText("Oooups", 20.0, kblack),
                  Icon(Icons.sentiment_dissatisfied,size: 30.0,color: Colors.red,)
                ],
              ),
              SizedBox(
                          height: 2,
                        ),
              NormalText("Aucune notification pour le moment",kgreyDark,16),
              IconButton(
                icon: Icon(Icons.replay),
                color: Colors.blue,
                onPressed: () {
                       null;
                    },
              )
            ],
          ),
        ),
      );

            },
          )
        ],
      ),
    ));
  }

  Padding notification() {
    return Padding(
    padding: const EdgeInsets.all(15.0),
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
