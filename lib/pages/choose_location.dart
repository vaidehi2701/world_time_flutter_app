import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url: 'America/Los_Angeles',location: 'Los_Angles',flag: 'los.png'),
    WorldTime(url: 'America/New_York',location: 'New_York',flag: 'new_york.png'),
    WorldTime(url: 'America/Toronto',location: 'Toronto',flag: 'Toronto.jpg'),
    WorldTime(url: 'Asia/Dubai',location: 'Dubai',flag: 'Dubai.png'),
    WorldTime(url: 'Asia/Kolkata',location: 'India',flag: 'Kolkata.png'),
    WorldTime(url: 'Asia/Qatar',location: 'Qatar',flag: 'Qatar.jpg'),
    WorldTime(url: 'Asia/Tokyo',location: 'Tokyo',flag: 'Tokyo.jpg'),
    WorldTime(url: 'Europe/Paris',location: 'Paris',flag: 'Paris.jpg'),
    WorldTime(url: 'Australia/Sydney',location: 'Sydney',flag: 'Sydney.png'),
    WorldTime(url: 'Indian/Maldives',location: 'Maldives',flag: 'Maldives.png'),
    WorldTime(url: 'Pacific/Tahiti',location: 'Tahiti',flag: 'Tahiti.png'),
  ];


  void updateTime(index) async{
    WorldTime worldTime=locations[index];
    await worldTime.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location' : worldTime.location,
      'time' : worldTime.time,
      'flag' : worldTime.flag,
      'isDayTime' : worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('location'),
        centerTitle: true,
      ),
          body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1 , horizontal: 4),
                child: Card(
                    child: ListTile(
                      onTap: (){
                        updateTime(index);
                        },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('image/${locations[index].flag}'),
                      ),
          ),
        ),
              );
    }),
    );}
}
