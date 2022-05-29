import 'dart:async';

import 'package:daily_life_reminder_app/Weather/services/weather.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  static const String id = '/location_screen';
  //LocationScreen({this.locationWeather});

  //final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool loading = false;
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  var locationWeather;

  @override
  void initState() {
    super.initState();
    getLocationData();
    Timer(const Duration(seconds: 5), () {
      updateUI(locationWeather);
    });
  }

  void getLocationData() async {
    setState(() async {
      locationWeather = await WeatherModel().getLocationWeather();
      loading = true;
      //loading = false;
    });

    //locationWeather = weatherData;
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return LocationScreen(
    //     locationWeather: weatherData,
    //   );
    // }));
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      loading = true;
      double temp = weatherData['main']['temp'];
      print(temp);
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      print(condition);
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading != true
        ? const Scaffold(
            body: Center(
              child: SpinKitDoubleBounce(
                color: Colors.red,
                size: 100.0,
              ),
            ),
          )
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/weather.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      kPrimaryColor.withOpacity(0.9), BlendMode.darken),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: 375.w,
              height: 812.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  /* -------------------------------------------------------------------------- */
                  /*                                  Day Name                                  */
                  /* -------------------------------------------------------------------------- */
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          DateFormat('EEEE').format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          DateFormat('d').format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  /* -------------------------------------------------------------------------- */
                  /*                                Location Name                               */
                  /* -------------------------------------------------------------------------- */
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.6),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 120.h,
                    width: 250.w,
                    child: Text(
                      cityName,
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.w900),
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  /* -------------------------------------------------------------------------- */
                  /*                                   Weather                                  */
                  /* -------------------------------------------------------------------------- */
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 120.h,
                    width: 250.w,
                    child: Text(
                      '$temperature°',
                      style: TextStyle(
                          fontSize: 80.sp, fontWeight: FontWeight.w900),
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  /* -------------------------------------------------------------------------- */
                  /*                                    Icon                                    */
                  /* -------------------------------------------------------------------------- */
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 120.h,
                    width: 250.w,
                    child: Text(
                      weatherIcon,
                      style: TextStyle(fontSize: 100.sp),
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  /* -------------------------------------------------------------------------- */
                  /*                          Search by city and reload                         */
                  /* -------------------------------------------------------------------------- */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: kWhiteColor.withOpacity(0.9),
                                spreadRadius: 9,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 120.h,
                          width: 150.w,
                          child: Text(
                            'Reload',
                            style: TextStyle(
                                fontSize: 30.sp, fontWeight: FontWeight.w900),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      /* -------------------------------------------------------------------------- */
                      /*                               Search By City                               */
                      /* -------------------------------------------------------------------------- */
                      GestureDetector(
                        onTap: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          if (typedName != null) {
                            var weatherData =
                                await weather.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.9),
                                spreadRadius: 9,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 120.h,
                          width: 150.w,
                          child: Text(
                            'Search By City Name',
                            style: TextStyle(
                                fontSize: 30.sp, fontWeight: FontWeight.w900),
                          ),
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
