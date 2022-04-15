import 'package:flutter/material.dart';
import 'package:test_for_8_app/screen/weatherScreen.dart';

import 'customTextStyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '8 app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> city = [
    "Пермь",
    "Краснодар",
    "Лондон",
    "Бугульма",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          itemCount: city.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 0,
              child: ListTile(
                title: Center(child: Text(city[index], style: customTextStyle(),)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherScreen(city: city[index],)));

                }, // Handle your onTap here. 

              ),
            );
        },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
