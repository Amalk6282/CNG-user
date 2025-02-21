import 'package:cng_users/filling_station_booking.dart';
import 'package:cng_users/home_screen.dart';
import 'package:cng_users/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class FillingStationDetails extends StatelessWidget {
  const FillingStationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Image.network(
                  'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF00A36C),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.navigate_before,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFF00A36C),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFF00A36C),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.report_gmailerrorred,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Freedom Fuel Filling Station,Kannur',
                      style: TextStyle(fontSize: 25),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Kannur,Kerala,Kannur',
                      style: TextStyle(color: Color(0xFF989898)),
                    )),
                SizedBox(
                  height: 25,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description: A fuel station is a facility where vehicles can refuel, typically offering gasoline, diesel, or electric charging stations. It usually includes pumps, a payment kiosk, and sometimes additional services \like a convenience store or car wash. Fuel stations are commonly located along highways, urban roads, or near rest areas, providing a convenient stop for drivers to fill up their tanks.',
                      style: TextStyle(),
                    )),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your Review',
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90))),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Lucy Guest',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '★★★★☆   9/4/2024',
                                style: TextStyle(color: Colors.black54),
                              )),
                        ])
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'This fuel station is great, The customer service wasgood, I feel like going there again to fuel my vehicle ifpossible, Highly recommending place, I don’t know why it has so low rating.',
                      style: TextStyle(color: Color(0xFF989898)),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit Your Review ?',
                          style: TextStyle(color: Color(0xFF00A36C)),
                        ))),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rating and Reviews',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_rounded))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 220,
                  width: 350,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius:
                                BorderRadius.all(Radius.circular(90))),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Harry Potter',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '★★★★☆   9/4/2024',
                            style: TextStyle(color: Colors.black54),
                          )),
                    ])
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'This fuel station is great, The customer service wasgood, I feel like going there again to fuel my vehicle ifpossible, Highly recommending place, I don’t know why it has so low rating.',
                      style: TextStyle(color: Color(0xFF989898)),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit Your Review ?',
                          style: TextStyle(color: Color(0xFF00A36C)),
                        ))),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rating and Reviews',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_rounded))
                  ],
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius:
                                BorderRadius.all(Radius.circular(90))),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Christopher',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '★★★★☆   9/4/2024',
                            style: TextStyle(color: Colors.black54),
                          )),
                    ])
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'This fuel station is great, The customer service wasgood, I feel like going there again to fuel my vehicle ifpossible, Highly recommending place, I don’t know why it has so low rating.',
                      style: TextStyle(color: Color(0xFF989898)),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit Your Review ?',
                          style: TextStyle(color: Color(0xFF00A36C)),
                        ))),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rating and Reviews',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_rounded))
                  ],
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius:
                                BorderRadius.all(Radius.circular(90))),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'John Gregory',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '★★★★☆   9/4/2024',
                            style: TextStyle(color: Colors.black54),
                          )),
                    ])
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'This fuel station is great, The customer service wasgood, I feel like going there again to fuel my vehicle ifpossible, Highly recommending place, I don’t know why it has so low rating.',
                      style: TextStyle(color: Color(0xFF989898)),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit Your Review ?',
                          style: TextStyle(color: Color(0xFF00A36C)),
                        ))),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rating and Reviews',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_rounded))
                  ],
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius:
                                BorderRadius.all(Radius.circular(90))),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Michael',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '★★★★☆   9/4/2024',
                            style: TextStyle(color: Colors.black54),
                          )),
                    ])
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'This fuel station is great, The customer service wasgood, I feel like going there again to fuel my vehicle ifpossible, Highly recommending place, I don’t know why it has so low rating.',
                      style: TextStyle(color: Color(0xFF989898)),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit Your Review ?',
                          style: TextStyle(color: Color(0xFF00A36C)),
                        ))),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rating and Reviews',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_rounded))
                  ],
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius:
                                BorderRadius.all(Radius.circular(90))),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Mathew ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '★★★★☆   9/4/2024',
                            style: TextStyle(color: Colors.black54),
                          )),
                    ])
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'This fuel station is great, The customer service wasgood, I feel like going there again to fuel my vehicle ifpossible, Highly recommending place, I don’t know why it has so low rating.',
                      style: TextStyle(color: Color(0xFF989898)),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit Your Review ?',
                          style: TextStyle(color: Color(0xFF00A36C)),
                        ))),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rating and Reviews',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_rounded))
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Row(
                  children: [
                    // ignore: prefer_const_constructors
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            minimumSize: const Size(150, 50.0),
                            backgroundColor: Color(0xFFF3F3F3)),
                        child: Text(
                          'Direction',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                    SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FillingStationBooking()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            minimumSize: const Size(150, 50.0),
                            backgroundColor: const Color(0xFF00A36C)),
                        child: Text(
                          'Book Now',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
