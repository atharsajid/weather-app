import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:wheather_app/Service/weather_api.dart';
import 'package:wheather_app/Theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcont = TextEditingController();

  // bool value = false;
  String city = "Karachi";
  String cty = "";
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/back3.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        // drawer: Drawer(),
        appBar: AppBar(
          title: Text("Weather Application"),
          centerTitle: true,
          // actions: [
          //   Icon(value ? Icons.dark_mode : Icons.light_mode),
          //   Switch.adaptive(
          //     value: value,
          //     onChanged: (value) {
          //       setState(
          //         () {
          //           this.value = value;
          //           currenttheme.toggle();
          //         },
          //       );
          //     },
          //   ),
          // ],
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
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  cty = value;
                },
                controller: searchcont,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  label: Text("Search"),
                  hintText: "City Name",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        searchcont.clear();
                      });
                    },
                    icon: Icon(Icons.clear, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: primary2, width: 2),
                  minimumSize: const Size(180, 50),
                  primary: primary2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    city = cty;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: primary2,
                  size: 22,
                ),
                label: Text(
                  "Find",
                  style: TextStyle(
                    color: primary2,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: getweather(city),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    margin: EdgeInsets.all(20),
                    height: 500,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      // color: Colors.white.withOpacity(0.4),
                      color: Colors.transparent,
                      border: Border.all(width: 3, color: primary2),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 5,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, -1),
                          child: Image.asset("assets/sunny.png"),
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            snapshot.data.celsius,
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 44,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.2),
                          child: Text(
                              "${snapshot.data.city},${snapshot.data.country}"),
                        ),
                        Align(
                          alignment: Alignment(0, 0.35),
                          child: Text(
                            snapshot.data.main,
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.55),
                          child: Text(
                            "${DateFormat.yMd().format(DateTime.now())}",
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 1.3),
                          child: Container(
                            height: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.air,
                                      color: primary,
                                    ),
                                    Text(
                                      "${snapshot.data.wind} Km/h",
                                      style: TextStyle(
                                        color: primary2,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Wind",
                                      style: TextStyle(
                                        color: primary,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.air,
                                      color: primary,
                                    ),
                                    Text(
                                      "${snapshot.data.humidity} %",
                                      style: TextStyle(
                                        color: primary2,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                        color: primary,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  datetime() {
    setState(() {});
  }
}
