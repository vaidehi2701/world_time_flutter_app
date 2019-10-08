import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/Loading.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/' :(context) => Loading(),
    '/home' :(context) => Home(),
    '/location' :(context) => ChooseLocation(),
  },
));


