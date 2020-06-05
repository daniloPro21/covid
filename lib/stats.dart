

import 'package:covid/core/casesData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:covid/view.dart';


 class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {





 @override
  void initState() {
    super.initState();
  }

  var futureCasesData = fetchCasesData();

  @override
  void didChangeDependencies() {
     fetchCasesData();
    super.didChangeDependencies();
  }



        


 @override
 Widget build(BuildContext context) 
 {
      return SingleChildScrollView(
        child: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child:  Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
                ]),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/second.jpg"),
                  )
            ),
          )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5),
                )
              ),
              child: Row( 
                children: <Widget>[
                  SvgPicture.asset("assets/Icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/Icons/dropdown.svg"),
                      value: "Yaounde",
                      items: ['Yaounde', 'Bafoussam', 'Douala', 'Maroua'].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                          );
                      }).toList(),
                      onChanged: (value){
                          
                      }
                      ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<String>(
            future: futureCasesData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return 
               
Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(text: TextSpan(
                        children: [TextSpan(
                          text: "Aujourd'hui\n",
                          style: KTitleTextStyle,
                          ),
                          TextSpan(text:'Mis à jour ce ', style: TextStyle(
                            color: KTextLightColor,
                          ),
                          ),
                          ]
                      ),
                      ),
                      Spacer(),
                      Text("Voir les Details", style: TextStyle(color: KPrimaryColor))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [BoxShadow(offset: Offset(0, 4),
                      blurRadius: 30,
                      color: KShadowColor,
                      ),
                      ], 
                      ),

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         Counter(color:  KDeathColor, number: data['today']['deaths'], title: "Morts"),
                         Counter(color:  KRecoverColor, number: data['today']['confirmed'], title: "Nouveaux cas"),
                        ],
                      )
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      RichText(text: TextSpan(
                        children: [TextSpan(
                          text: "Statistiques generale\n",
                          style: KTitleTextStyle,
                          ),
                          TextSpan(text: "Mis à jour le", style: TextStyle(
                            color: KTextLightColor,
                          ),
                          ),
                          ]
                      ),
                      ),
                      Spacer(),
                      Text("Voir les Details", style: TextStyle(color: KPrimaryColor))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [BoxShadow(offset: Offset(0, 4),
                      blurRadius: 30,
                      color: KShadowColor,
                      ),
                      ], 
                      ),

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         Counter(color:  KinfectedColor, number:data['latest_data']['confirmed'], title: "Infectés"),
                         Counter(color:  KDeathColor, number: data['latest_data']['deaths'], title: "Morts"),
                         Counter(color:  KRecoverColor, number: data['latest_data']['recovered'], title: "Guerris"),
                        ],
                      )
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Propagation du Virus", style: KTitleTextStyle,),
                      Text("Voir les Details", style: TextStyle(
                        color: KPrimaryColor,
                        fontWeight: FontWeight.w600
                      ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 30,
                      color: KShadowColor
                      ),
                      ]
                    ),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         DCounter(color:  KinfectedColor,
                          number:double.parse( data['latest_data']['calculated']['death_rate'].toStringAsFixed(2))
                         , title: "Taux de mortlité"),
        
                         DCounter(color:  KRecoverColor, number: 
                         double.parse( data['latest_data']['calculated']['recovery_rate'].toStringAsFixed(2)), title: "Taux de guerison"),
                        ],
                      ),
                    //child: Image.asset("assets/images/map.png", fit: BoxFit.contain)
                  ),
                   SizedBox(height: 20)
                ],
              ), 
              ) ;
                
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ) 
        ],
      )
      );
 }

}

  

  class Counter extends StatelessWidget{

  final int number;
  final Color color;
  final String title;

  Counter({
    Key key,
    this.number,
    this.color,
    this.title
  }) : super(key: key);


 
  @override
  Widget build(BuildContext context) {
    
    return Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(6),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: color.withOpacity(.26), 
                                  ),
                                  child: Container(
                                   decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     color: Colors.transparent,
                                     border: Border.all(
                                       color: color,
                                       width: 2,
                                     ),
                                   ),
                                  ),
                              ),
                              SizedBox(height: 10),
                              Text("$number", style: TextStyle(
                                fontSize: 20,
                                color: color,
                              ),
                              ),
                              Text(title, style: KsubTextStyle),
                              
                            ],
                          );
  }

}



class DCounter extends StatelessWidget{

  final double number;
  final Color color;
  final String title;

  DCounter({
    Key key,
    this.number,
    this.color,
    this.title
  }) : super(key: key);


 
  @override
  Widget build(BuildContext context) {
    
    return Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(6),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: color.withOpacity(.26), 
                                  ),
                                  child: Container(
                                   decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     color: Colors.transparent,
                                     border: Border.all(
                                       color: color,
                                       width: 2,
                                     ),
                                   ),
                                  ),
                              ),
                              SizedBox(height: 10),
                              Text("$number", style: TextStyle(
                                fontSize: 20,
                                color: color,
                              ),
                              ),
                              Text(title, style: KsubTextStyle),
                              
                            ],
                          );
  }

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return false;
   
  }

}