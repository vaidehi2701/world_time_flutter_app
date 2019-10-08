import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

Map data={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage=data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,150,0,0),
          child: SafeArea(child: Column(
            children: <Widget>[
            FlatButton.icon(
                onPressed:() async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : result['time'],
                      'location' : result['location'],
                      'isDayTime' : result['isDayTime'],
                      'flag' : result['flag']
                    };
                  });
                  },
                icon: Icon(Icons.location_on ,
                color: Colors.white,),
                label: Text('Edit Location',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    letterSpacing:2
                  ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(data['time'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 55
              ),)
          ],)),
        ),
      ),
    );
  }
}

