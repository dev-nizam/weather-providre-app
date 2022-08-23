import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_new_weather_app/model/weatherModel.dart';
import 'package:my_new_weather_app/provider/Weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
   String city = "malappuram";
  Weathermodel? weathermodel;
  bool loading = true;

  @override
  void initState() {
    final trendingProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    trendingProvider.getWeatherApiData(context,city);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: weatherProvider.loading
          ? const Center(
              child:  CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                //  height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration:  BoxDecoration(
                  image:weatherProvider.weathermodel.current!.isDay==1? DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'asset/image/25-252084_m.jpg',
                    ),
                  ): DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'asset/image/2444e87b261bc4873ff72f02c041131d--monarch-butterfly-charlotte.jpg',
                    ),
                  ),
                ),

                child: Column(
                  children: [
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
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            // SizedBox(
                            //   width: 80,
                            // ),
                             Text(

                              weatherProvider.weathermodel.location!.name!,
                              style:
                                  const TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            // SizedBox(
                            //   width: 100,
                            // ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
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
                        onSubmitted: (value){
                          final trendingProvider =
                          Provider.of<WeatherProvider>(context, listen: false);
                          trendingProvider.getWeatherApiData(context,value);
                          if (value.isEmpty) {
                            setState(() {
                              city = "malappuram";
                            });
                          } else {
                            setState(() {
                              city =value;
                            });
                            print(city);
                          }


                        },
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
                                 weatherProvider.weathermodel.current!.tempC!.toString(),
                                  style: TextStyle(
                                      fontSize: 100, color: Colors.white),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 60),
                                      child: Row(
                                        children: const [
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
                            weatherProvider.weathermodel.current!.condition!.text.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.leaf,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'AQI 2',
                              style: const TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey[400])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 270, top: 150),
                            child: Row(
                              children: [
                                // Text("More details",style: TextStyle(color: Colors.white,fontSize: 10),),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "More details",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                const Icon(
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
                    const SizedBox(),
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
                                icon: const Icon(
                                  FontAwesomeIcons.cloudMoon,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                label: const Text(
                                  "Today'Cloudy",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const Text(
                                "28\u00B0/23\u00B0",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.cloud,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                label: const Text(
                                  "Tomorrow'Thunderstorm",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const Text(
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
                                icon: const Icon(
                                  FontAwesomeIcons.cloudRain,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                label: const Text(
                                  "Thu'Rain",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const Text(
                                "28\u00B0/22\u00B0",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
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
                            child: const Text(
                              "5-day forecast",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text("Now\n28\u00b0"),
                              const Icon(Icons.cloud),
                              Row(
                                children: const [
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
                              const Text("12:00\n27\u00b0"),
                              const Icon(Icons.cloud),
                              Row(
                                children: const [
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
                              const Text("13:00\n30\u00b0"),
                              const Icon(Icons.wb_sunny),
                              Row(
                                children: const [
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
                              const Text("14:00\n29\u00b0"),
                              const Icon(Icons.sunny),
                              Row(
                                children: const [
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
                        color: const Color(0xff6398e6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      "humidity",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      // (snapshot.data!.current!.humidity)
                                      //     .toString(),
                                      weatherProvider.weathermodel.current!.humidity.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        "Chance of rain",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        "25%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: 30,
                                // ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      "Pressur",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      // (snapshot.data!.current!.pressureMb)
                                      //     .toString(),
                                      weatherProvider.weathermodel.current!.pressureMb.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      "Wind speed",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      // (snapshot.data!.current!.windMph)
                                      //     .toString(),
                                      weatherProvider.weathermodel.current!.windMph.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      "Uv index",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      // (snapshot.data!.current!.uv).toString(),
                                      weatherProvider.weathermodel.current!.uv.toString(),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color(0xff6398e6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Air Quality index"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
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
                                      child: const Text(
                                        "Full Air Quality Forecast",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

