import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime current = WorldTime(location: 'Kathmandu', flag: 'nepal.png', url: 'Asia/kathmandu');
    await current.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {'location': current.location,'flag':current.flag,'time':current.time, 'isDay':current.isDay});
  }

   @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
      child:SpinKitDoubleBounce(color: Colors.black,size: 180,)
      ),
    );
  }
}