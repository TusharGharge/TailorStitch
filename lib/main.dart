import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailorstitch/Provider/dataProvider.dart';
import 'package:tailorstitch/Screens/MainPage.dart';
import 'package:tailorstitch/Screens/measurescreen.dart';
import 'package:tailorstitch/Screens/paint.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  MainPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          MeasureScreen.idScreen: (ctx) => MeasureScreen(),
          MainPage.idScreen:(ctx)=>MainPage(),
          CanvasPainting.idScreen: (ctx) => CanvasPainting(),
          
        },
      ),
    );
  }
}
