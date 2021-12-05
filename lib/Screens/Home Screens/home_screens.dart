import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  String city = "Karachi";
  String cty = "";
  String img = "assets/thunder.png";

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
        appBar: AppBar(
          title: Text("Weather Application"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //search Bar custom widget
            searchBar(),
            //find button custom widget
            findButton(),
            FutureBuilder(
              future: getweather(city),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());

                  default:
                    if (snapshot.hasError) {
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
                          children: const [
                            Align(
                              alignment: Alignment(0, -0.4),
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 100,
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0),
                              child: Text(
                                "City Not Found \n or Incorrect Name",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return wContainer(context, snapshot, img);
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

//Find Button Widget
  Container findButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: primary2, width: 2),
          minimumSize: const Size(180, 50),
          primary: primary2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
    );
  }

//search bar widget
  Container searchBar() {
    return Container(
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
    );
  }

//Container which have weather detail
  Container wContainer(
    BuildContext context,
    AsyncSnapshot<dynamic> snapshot,
    String img,
  ) {
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
            alignment: Alignment(0, -1.3),
            child: Image.asset(
              img,
            ),
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
            child: Text("${snapshot.data.city},${snapshot.data.country}"),
          ),
          Align(
            alignment: Alignment(0, 0.35),
            child: Text(
              snapshot.data.description,
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

  datetime() {
    setState(() {});
  }
}
