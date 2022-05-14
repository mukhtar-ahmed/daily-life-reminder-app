import 'package:daily_life_reminder_app/Weather/Services/weather.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  late var locationWeather;
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  bool isLoading = true;
  late String typedName;

  @override
  void onInit() {
    getLocationData();
    super.onInit();
  }

  void getLocationData() async {
    locationWeather = await WeatherModel().getLocationWeather();
    isLoading = false;
    updateUI(locationWeather);
    update();
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      cityName = '';
      return;
    }
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];

    weatherIcon = weather.getWeatherIcon(condition);
    Get.snackbar('eee', condition);
    cityName = weatherData['name'];
    update();
  }
}
