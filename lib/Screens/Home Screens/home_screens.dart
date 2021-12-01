import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:wheather_app/Service/weather_api.dart';
import 'package:wheather_app/Theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcont = TextEditingController();
  bool value = false;
  String city = "Karachi";
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(value ? "assets/back3.jpg" : "assets/back2.jpg"),
      //     fit: BoxFit.cover,
      //     colorFilter:
      //         ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
      //   ),
      // ),
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("Weather Application"),
          actions: [
            Icon(value ? Icons.dark_mode : Icons.light_mode),
            Switch.adaptive(
              value: value,
              onChanged: (value) {
                setState(
                  () {
                    this.value = value;
                    currenttheme.toggle();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.all(10),
              height: 60,
              width: double.infinity,
              child: TextField(
                onChanged: (value) {},
                controller: searchcont,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on,
                  ),
                  label: Text("Search"),
                  hintText: "City Name",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 400,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ],
              ),
              child: Stack(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
