import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDay']?'day.png':'night.png';
    Color bgColor = data['isDay']?Colors.blue: Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/$bgImage'),fit:BoxFit.cover)),
                  child: Padding(padding: EdgeInsets.fromLTRB(0,110,0,0),child: Column(children: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/Location');
              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'flag': result['flag'],
                  'isDay': result['isDay']
                };
              });
            },
            icon : Icon(Icons.edit_location,color: Colors.blueGrey[100],),
            label: Text('Edit Location',style: TextStyle(color: Colors.blueGrey[100]),),
          ),
          SizedBox(height: 20,),
          CircleAvatar(backgroundImage: AssetImage('assets/${data['flag']}')),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(data['location'],style:TextStyle(fontSize: 28,letterSpacing: 2,color: Colors.blueGrey[100]))
          ],),
          SizedBox(height:70),
          Text(data['time'],style: TextStyle(fontSize: 80,color: Colors.blueGrey[100]),),
      ],)),
        )      
    ));
  }
 }