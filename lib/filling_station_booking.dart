import 'package:cng_users/home_screen.dart';
import 'package:cng_users/screens/booking_confirm.dart';
import 'package:flutter/material.dart';

class FillingStationBooking extends StatelessWidget {
  const FillingStationBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Freedom Fuel Filling Station,Kannur',
                style: TextStyle(fontSize: 35),
              ),
              Text(
                'Kannur,Kannur,Kerala',
                style: TextStyle(fontSize: 15, color: Color(0xFF989898)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '0123456789',
                style: TextStyle(color: Color(0xFF0047FF)),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Column(
                    children: [
                      Container(
                        foregroundDecoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF00A36C)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        width: 410,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Available Slots \n 7am-9pm',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Color(0xFF00A36C)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('🟩  Selected'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('🔲 Not Selected'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('🟨  Reserved')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(children: [
                                  BookingButton(
                                      label: '07:00am', label2: '07:10am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '07:20am', label2: '07:30am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '07:40am', label2: '07:50am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '08:00am', label2: '08:10am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '08:20am', label2: '08:30am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '08:40am', label2: '08:50am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '09:00am', label2: '09:10am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '09:20am', label2: '09:30am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '09:40am', label2: '09:50am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '10:00am', label2: '10:10am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '10:20am', label2: '10:30am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '10:40am', label2: '10:50am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '11:00am', label2: '11:10am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '11:20am', label2: '11:30am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '11:40am', label2: '11:50am'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '12:00pm', label2: '12:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '12:20pm', label2: '12:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '12:40pm', label2: '12:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '01:00pm', label2: '01:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '01:20pm', label2: '01:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '01:40pm', label2: '01:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '02:00pm', label2: '02:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '02:20pm', label2: '02:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '02:40pm', label2: '02:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '03:00pm', label2: '03:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '03:20pm', label2: '03:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '03:40pm', label2: '03:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '04:00pm', label2: '04:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '04:20pm', label2: '04:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '04:40pm', label2: '04:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '05:00pm', label2: '05:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '05:20pm', label2: '05:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '05:40pm', label2: '05:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '06:00pm', label2: '06:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '06:20pm', label2: '06:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '06:40pm', label2: '06:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '07:00pm', label2: '07:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '07:20pm', label2: '07:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '07:40pm', label2: '07:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '08:00pm', label2: '08:10pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '08:20pm', label2: '08:30pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookingButton(
                                      label: '08:40pm', label2: '08:50pm'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(children: [
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
                                    side: BorderSide(color: Color(0xFF00A36C)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                minimumSize: const Size(150, 50.0),
                                backgroundColor: Color(0xFFF3F3F3)),
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingConfirm()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                minimumSize: const Size(150, 50.0),
                                backgroundColor: const Color(0xFF00A36C)),
                            child: Text(
                              'Next',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ))
                      ])
                    ],
                  ))
            ],
          ),
        )
      ],
    ));
  }
}

class BookingButton extends StatelessWidget {
  final String label;
  final String label2;
  const BookingButton({
    super.key,
    required this.label,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(125.0, 45.0),
                backgroundColor: const Color(0xFF00A36C)),
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            )),
        SizedBox(
          width: 30,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(125.0, 45.0),
                backgroundColor: const Color(0xFF00A36C)),
            child: Text(
              label2,
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
