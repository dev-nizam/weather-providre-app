import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_new_weather_app/model/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override

  String city = "malappuram";

  Future<Weathermodel> fetchWeather(String city) async {
    final res = await http.get(
        Uri.parse('https://weatherapi-com.p.rapidapi.com/current.json?q=$city'),
        headers: {
          'X-RapidAPI-Key':
          '11e4b161bfmsh1b58c2cd21f6829p10ba09jsn5ae9055a4b23',
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
        });
    print(res.body);

    return Weathermodel.fromJson(jsonDecode(res.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // FutureBuilder(
      //     future: fetchWeather(city),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<Weathermodel> snapshot) {
      //       if (snapshot.hasData) {
      //         print("hasdata worked");
              //   // return Center(
              //   //   child: Text(snapshot.data!.location!.name.toString()),
              //   // );
              // }
              // return
      SingleChildScrollView(
                child: Container(
                  //  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image:
        // (snapshot.data!.current!.isDay) == 1
        //                   ?
    DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'asset/image/25-252084_m.jpg',
                          )),),
                          // : DecorationImage(
                          // fit: BoxFit.cover,
                          // image: AssetImage(
                          //   'asset/image/2444e87b261bc4873ff72f02c041131d--monarch-butterfly-charlotte.jpg',
                          // ))),
                  child: Column(
                    children: [
                      // Image.network("https://news-cdn.softpedia.com/images/news2/YoWindow-for-iOS-a-User-Friendly-Animated-Weather-App-18.png"),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(
                              //   width: 25,
                              // ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              // SizedBox(
                              //   width: 80,
                              // ),
                              Text(
                                // (snapshot.data!.location!.name.toString()),
                                  "malappuram",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              // SizedBox(
                              //   width: 100,
                              // ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 40,
                        child: TextField(
                          // onSubmitted: (value) {
                          //   if (value.isEmpty) {
                          //     setState(() {
                          //       city = "malappuram";
                          //     });
                          //   } else {
                          //     setState(() {
                          //       city = value.toString();
                          //     });
                          //   }
                          // },
                          decoration: InputDecoration(
                              labelText: "search",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Container(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // (snapshot.data!.current!.tempC).toString(),
                                "hhhhh",
                                    style: TextStyle(
                                        fontSize: 100, color: Colors.white),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 60),
                                        child: Row(
                                          children: [
                                            Text(
                                              "o",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "C",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Text(
                              // (snapshot.data!.current!.condition!.text)
                              //     .toString(),
                            "yyoyo",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.leaf,
                                color: Colors.white,
                              ),
                              label: Text(
                                'AQI 2',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[400])),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 270, top: 150),
                              child: Row(
                                children: [
                                  // Text("More details",style: TextStyle(color: Colors.white,fontSize: 10),),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "More details",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(),
                      Container(
                        height: 180,
                        width: 400,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.cloudMoon,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  label: Text(
                                    "Today'Cloudy",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                Text(
                                  "28\u00B0/23\u00B0",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.cloud,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  label: Text(
                                    "Tomorrow'Thunderstorm",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                Text(
                                  "28\u00B0/24\u00B0",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.cloudRain,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  label: Text(
                                    "Thu'Rain",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                Text(
                                  "28\u00B0/22\u00B0",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(160),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "5-day forecast",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Now\n28\u00b0"),
                                Icon(Icons.cloud),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.send,
                                      size: 5,
                                    ),
                                    Text(
                                      "7.4km/h",
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("12:00\n27\u00b0"),
                                Icon(Icons.cloud),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.send,
                                      size: 5,
                                    ),
                                    Text(
                                      "14.4km/h",
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("13:00\n30\u00b0"),
                                Icon(Icons.wb_sunny),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.send,
                                      size: 5,
                                    ),
                                    Text(
                                      "18.4km/h",
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("14:00\n29\u00b0"),
                                Icon(Icons.sunny),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.send,
                                      size: 5,
                                    ),
                                    Text(
                                      "20.4km/h",
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color(0xff6398e6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Real feel",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "25\u00b0C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "humidity",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        // (snapshot.data!.current!.humidity)
                                        //     .toString(),
                                      "jhgjg",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "Chance of rain",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "25%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),

                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pressur",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        // (snapshot.data!.current!.pressureMb)
                                        //     .toString(),
                                           "ghjg",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Wind speed",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        // (snapshot.data!.current!.windMph)
                                        //     .toString(),
                                           "ghjg",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),

                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Uv index",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        // (snapshot.data!.current!.uv).toString(),
                                         "ghjg",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color(0xff6398e6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Air Quality index"),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.leaf,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "8",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Full Air Quality Forecast",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            }

          //   if (snapshot.hasError) {
          //     return Center(
          //       child: Text('error'),
          //     );
          //   }
          //   return Container(
          //     child: Center(
          //       child: Text('default'),
          //     ),
          //   );
    //        }),
    // );
  // }
}

