import 'package:flutter/material.dart';
import '../API/getWeather.dart';
import '../customTextStyle.dart';

class WeatherScreen extends StatefulWidget {
  final String city;
  const WeatherScreen ({ Key? key, required this.city }): super(key: key);


  @override
  createState() => new WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: FutureBuilder<List>(
              future: getHttp(widget.city),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data![0]) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                              'http://openweathermap.org/img/wn/${snapshot.data![1]}@2x.png'),
                          Text(snapshot.data![2] + "°", style: customTextStyle()),
                          Text(snapshot.data![3], style: customTextStyle()),
                        ],
                      ),
                    );
                  } else {
                    switch (snapshot.data![1]) {
                      case 5:
                        WidgetsBinding.instance?.addPostFrameCallback((_){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 3),
                                content: Text('Проверьте интернет соединение'),
                                action: SnackBarAction(
                                  label: 'Повторить',
                                  onPressed: () {
                                    setState(() {
                                      getHttp(widget.city);
                                    });
                                    // Some code to undo the change.
                                  },
                                ),
                              )
                          );
                          // Add Your Code here.

                        });
                        break;
                    }
                    return Center(child: Text('Проверьте интернет соединение'));
                  }
                }
                // By default, show a loading spinner.
                return Center(child: const CircularProgressIndicator());
              },
            )));
  }
}