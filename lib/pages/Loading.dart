import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setupTime() async {

    WorldTime instance= WorldTime(location: 'India',flag: 'germeny.png',url: 'Asia/Kolkata');
    await instance.getTime();

    Navigator.pushNamed(context,'/home',arguments: {
    'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDayTime' : instance.isDayTime,
    });
    print(instance.time);
    setState(() {
        time=instance.time;
    });
  }

@override
  void initState() {
    super.initState();
    setupTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 70.0,
      ),
      )
    );
  }
}
