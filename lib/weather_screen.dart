import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/secrets.dart';
import 'package:weather_app/weather_hourly_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  
 
  Future getCurrentWeather() async{
    String cityName = "London";
   final res = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey",),
    );

    print(res.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // to get some splash effect use Inkwell but gesturedector doesnt have it or use iconbutton nice and cool
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                //makes to clip and add the nice border radius
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  //makes it to merge with the bgcolor
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "300K",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 16),
                          Text("Rain", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //weather forcast cards
            Text(
              "Weather Forcast",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForcastItem(time: "00:00",icon: Icons.cloud,temperature: "301.22",),
                   HourlyForcastItem(time: "03:00",icon: Icons.sunny,temperature: "300.52",),
                    HourlyForcastItem(time: "06:00",icon: Icons.cloud,temperature: "302.22",),
                     HourlyForcastItem(time: "09:00",icon: Icons.cloudy_snowing,temperature: "200.72",),
                     HourlyForcastItem(time: "12:00",icon: Icons.sunny,temperature: "304.12",),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Additional Information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                additionalInfoItem(icon: Icons.water_drop,label: "Humidity",value: "91",),
                additionalInfoItem(icon: Icons.air,label: "Wind Speed",value: "7.67",),
                additionalInfoItem(icon:Icons.beach_access,label: "Pressure",value: "1000",),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

