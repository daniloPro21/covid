import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_dialogflow/flutter_dialogflow.dart';





class HomePageDialogflow extends StatefulWidget {
  HomePageDialogflow({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageDialogflow createState() => new _HomePageDialogflow();
}

class _HomePageDialogflow extends State<HomePageDialogflow> {


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

 var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

Future<void> _showNotification(String text) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'Message', '$text', platformChannelSpecifics,
        payload: 'item x');
  }

@override
  void initState() {
    
    super.initState();

    var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initilializationSettingsIOS = new IOSInitializationSettings();

    var initializationSetings = new InitializationSettings(
      initializationSettingsAndroid, initilializationSettingsIOS);

      flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin.initialize(initializationSetings);   

  }

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
  margin: EdgeInsets.all(15.0),
  height: 61,
  child: Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35.0),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  color: Colors.grey)
            ],
          ),
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.face), onPressed: () {}),
              Expanded(
                child: TextField(
                   controller: _textController,
                onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                      hintText: "envoyer un message",
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      SizedBox(width: 15),
      Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.blue, shape: BoxShape.circle),
        child: InkWell(
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
         onTap: ()  =>  _handleSubmitted(_textController.text),
        ),
      )
    ],
  ),
),
    );
  }

  void response(query) async {



    _textController.clear();
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/steve-tmnbqr-29cf296ac658.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.french);

  

    AIResponse response = await dialogflow.detectIntent(query);


      
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]),
      name: "Steve",
      type: false,
    );

     _showNotification(message.text); 


    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Moi",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
     
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: new Container(
            margin: const EdgeInsets.all(5.0),
             width: 100.0,
             height: 100.0,
             decoration: new BoxDecoration(
               color: const Color(0xff7c94b6),
               image: new DecorationImage(
                 image: new AssetImage("assets/images/bot.jpg"),
                 fit: BoxFit.cover,
               ),
               borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
               border: new Border.all(
                 color: Colors.green,
                 width: 4.0,
               ),
             ),
           ),
       
        title: new Text(" Steve",style: TextStyle(color: Colors.blue,fontSize: 24,
        fontWeight: FontWeight.bold),),
      ),
      body: new GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child:  new Column(
        children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
      )
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
            margin: const EdgeInsets.only(right:15.0),
             width: 50.0,
             height: 50.0,
             decoration: new BoxDecoration(
               color: const Color(0xff7c94b6),
               image: new DecorationImage(
                 image: new AssetImage("assets/images/bot.jpg"),
                 fit: BoxFit.cover,
               ),
               borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
               border: new Border.all(
                 color: Colors.green,
                 width: 4.0,
               ),
             ),
           ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Bubble(
                elevation: 1,
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nipWidth: 8,
  nipHeight: 24,
  nip: BubbleNip.leftTop,
  child: new  Text(text),
),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name, style: Theme.of(context).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Bubble(
                margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Colors.blue,
                child: new Text(text,style: TextStyle(color:Colors.white),),
              )
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
            child: new Icon(Icons.person_outline)
            ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}