import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart'; 
 
 class chooseLocation extends StatefulWidget {
   @override
   _chooseLocationState createState() => _chooseLocationState();
 }
 
 class _chooseLocationState extends State<chooseLocation> {
   
    List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'nepal.png'),
    WorldTime(url: 'Asia/karachi', location: 'Karachi', flag: 'pakistan.png'),
    WorldTime(url: 'Asia/kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'Asia/Hong_kong', location: 'Hong kong', flag: 'china.png'),
  ];

  void updateTime(index) async {
    WorldTime current = locations[index];
    await current.getTime();
    Navigator.pop(context,{'location': current.location,'flag':current.flag,'time':current.time, 'isDay':current.isDay});
  }
   @override Widget build(BuildContext context) {

     return Scaffold(
       backgroundColor: Colors.blueGrey[900],
       appBar: AppBar(backgroundColor: Colors.blueGrey[600],title:Text('Choose Location'),centerTitle: true,),
       body: ListView.builder(itemCount: locations.length, itemBuilder: (context,index){
         return Padding(padding:EdgeInsets.symmetric(vertical: 1,horizontal:4), child: Card(color:Colors.blueGrey[600],margin:EdgeInsets.fromLTRB(10, 10, 10, 0) , child:ListTile(onTap: (){updateTime(index);} , title:Text(locations[index].location),leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),),)));
        })
     );
   }
 }

