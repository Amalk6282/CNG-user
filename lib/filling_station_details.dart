import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cng_users/filling_station_booking.dart';
import 'package:cng_users/home_screen.dart';

class FillingStationDetails extends StatefulWidget {
  final Map stationDetails;
  const FillingStationDetails({super.key, required this.stationDetails});

  @override
  State<FillingStationDetails> createState() => _FillingStationDetailsState();
}

class _FillingStationDetailsState extends State<FillingStationDetails> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final stationDetails = widget.stationDetails;
    final phone = stationDetails['phone'];
    final latitude = stationDetails['location_latitude'];
    final longitude = stationDetails['location_longitude'];
    final imageUrl = stationDetails['image_url'];
    final name = stationDetails['name'];
    final address = stationDetails['address_line'];
    final place = stationDetails['place'];
    final district = stationDetails['district'];
    final state = stationDetails['state'];
    final pincode = stationDetails['pincode'];

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: _scrollOffset > 200 ? 2 : 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                              Colors.black.withOpacity(0.4),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackButton(),
                ),
                actions: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF00A36C),
                    child: FillingStationFavorite(
                        stationId: stationDetails['user_id']),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Color(0xFF00A36C),
                    child: IconButton(
                      icon: Icon(Icons.flag_outlined, color: Colors.white),
                      onPressed: () {
                        showReportIssueDialog(
                            context, stationDetails['user_id']);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Color(0xFF00A36C), size: 16),
                          SizedBox(width: 4),
                          Text(
                            '$place, $district, $state, $pincode',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24),
                      Text(
                        'Available CNG Capacity',
                        style: TextStyle(
                          color: Colors.green[600],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.stationDetails['capacity'].toString() + ' kg',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFF00A36C).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About CNG',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '''Compressed Natural Gas (CNG) is an eco-friendly alternative fuel made by compressing natural gas to less than 1% of its volume. Primarily composed of methane, CNG offers significant environmental and economic advantages for today's drivers.
CNG delivers exceptional performance with lower emissions than conventional fuels. Vehicles running on CNG produce up to 90% less carbon monoxide, 80% fewer nitrogen oxides, and virtually no particulate matter compared to gasoline or diesel engines. This translates to cleaner air and reduced greenhouse gas emissions, making CNG an intelligent choice for environmentally conscious consumers.
Beyond environmental benefits, CNG typically costs 30-40% less than traditional fuels while providing comparable performance and range. CNG vehicles require less maintenance due to reduced engine wear and longer intervals between service appointments.
With an expanding nationwide refueling infrastructure and government incentives for alternative fuel adoption, CNG represents not just a cleaner choice, but a smarter long-term investment for both individual drivers and fleet operators looking to reduce their carbon footprint while managing fuel costs effectively.''',
                              style: TextStyle(
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 80), // Space for bottom buttons
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL('tel:$phone'),
                      icon: Icon(Icons.call, color: Colors.white),
                      label: Text('Call'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF00A36C),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL(
                          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'),
                      icon: Icon(Icons.directions, color: Colors.white),
                      label: Text('Directions'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF00A36C),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SlotBookingScreen()),
                        );
                      },
                      icon: Icon(Icons.calendar_today),
                      label: Text('Book Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF00A36C),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cng_users/filling_station_booking.dart';
// import 'package:cng_users/home_screen.dart';

// class FillingStationDetails extends StatefulWidget {
//   final Map stationDetails;
//   const FillingStationDetails({super.key, required this.stationDetails});

//   @override
//   State<FillingStationDetails> createState() => _FillingStationDetailsState();
// }

// class _FillingStationDetailsState extends State<FillingStationDetails> {
//   final ScrollController _scrollController = ScrollController();
//   double _scrollOffset = 0;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       setState(() {
//         _scrollOffset = _scrollController.offset;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Widget _buildReviewCard(String name, String date) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 24),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 48,
//                 width: 48,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xFF00A36C),
//                       Color(0xFF00A36C).withOpacity(0.7)
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: Center(
//                   child: Text(
//                     name[0],
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.amber, size: 16),
//                         Icon(Icons.star, color: Colors.amber, size: 16),
//                         Icon(Icons.star, color: Colors.amber, size: 16),
//                         Icon(Icons.star, color: Colors.amber, size: 16),
//                         Icon(Icons.star_border, color: Colors.amber, size: 16),
//                         SizedBox(width: 8),
//                         Text(
//                           date,
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           Text(
//             'This fuel station is great! The customer service was excellent. I feel like going there again to fuel my vehicle. Highly recommended place!',
//             style: TextStyle(
//               color: Colors.grey[700],
//               height: 1.5,
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               padding: EdgeInsets.zero,
//               alignment: Alignment.centerLeft,
//             ),
//             child: Text(
//               'Edit Review',
//               style: TextStyle(
//                 color: Color(0xFF00A36C),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           CustomScrollView(
//             controller: _scrollController,
//             slivers: [
//               SliverAppBar(
//                 expandedHeight: 300,
//                 pinned: true,
//                 backgroundColor: Colors.white,
//                 elevation: _scrollOffset > 200 ? 2 : 0,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Image.network(
//                         'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [
//                               Colors.black.withOpacity(0.4),
//                               Colors.transparent,
//                               Colors.black.withOpacity(0.4),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 leading: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     backgroundColor: Color(0xFF00A36C),
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//                 ),
//                 actions: [
//                   CircleAvatar(
//                     backgroundColor: Color(0xFF00A36C),
//                     child: IconButton(
//                       icon: Icon(Icons.favorite_border, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   CircleAvatar(
//                     backgroundColor: Color(0xFF00A36C),
//                     child: IconButton(
//                       icon: Icon(Icons.flag_outlined, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: Container(
//                   padding: EdgeInsets.all(24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Freedom Fuel Filling Station',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Icon(Icons.location_on,
//                               color: Color(0xFF00A36C), size: 16),
//                           SizedBox(width: 4),
//                           Text(
//                             'Kannur, Kerala',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 24),
//                       Container(
//                         padding: EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Color(0xFF00A36C).withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'About',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'A modern fuel station offering premium quality gasoline and diesel, along with convenient amenities. Features state-of-the-art pumps, digital payment options, and professional service.',
//                               style: TextStyle(
//                                 color: Colors.grey[700],
//                                 height: 1.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 24),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Reviews',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextButton.icon(
//                             onPressed: () {},
//                             icon: Icon(Icons.star, color: Colors.amber),
//                             label: Text(
//                               '4.5 (128 reviews)',
//                               style: TextStyle(
//                                 color: Colors.grey[700],
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 16),
//                       _buildReviewCard('Lucy Guest', '9/4/2024'),
//                       _buildReviewCard('Harry Potter', '9/4/2024'),
//                       _buildReviewCard('Christopher', '9/4/2024'),
//                       SizedBox(height: 80), // Space for bottom buttons
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                     offset: Offset(0, -4),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomeScreen()),
//                         );
//                       },
//                       icon: Icon(Icons.directions, color: Color(0xFF00A36C)),
//                       label: Text('Directions'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF00A36C).withOpacity(0.1),
//                         foregroundColor: Color(0xFF00A36C),
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SlotBookingScreen()),
//                         );
//                       },
//                       icon: Icon(Icons.calendar_today),
//                       label: Text('Book Now'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF00A36C),
//                         foregroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

void showReportIssueDialog(BuildContext context, String filingStationUserId) {
  final _formKey = GlobalKey<FormState>();
  final _issueController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Report Issue'),
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _issueController,
            decoration: InputDecoration(
              labelText: 'Describe the issue',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an issue description';
              }
              return null;
            },
            maxLines: 3,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // Push the issue to the database
                await Supabase.instance.client.from('reports').insert({
                  'report': _issueController.text,
                  'user_id': Supabase.instance.client.auth.currentUser?.id,
                  'filings_station_user_id': filingStationUserId,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Issue reported successfully!'),
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}

class FillingStationFavorite extends StatefulWidget {
  final String stationId;
  const FillingStationFavorite({super.key, required this.stationId});

  @override
  State<FillingStationFavorite> createState() => _FillingStationFavoriteState();
}

class _FillingStationFavoriteState extends State<FillingStationFavorite> {
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorited();
  }

  void _checkIfFavorited() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final stationId = widget.stationId;

    if (userId != null) {
      List<Map<String, dynamic>> response = await Supabase.instance.client
          .from('customer_favourite_stations')
          .select()
          .eq('customer_user_id', userId)
          .eq('filling_station_user_id', stationId);

      if (response.isNotEmpty) {
        setState(() {
          isFavorited = true;
        });
      }
    }
  }

  void _toggleFavorite() async {
    if (isFavorited) {
      await _removeFromFavorites();
    } else {
      await _addToFavorites();
    }
  }

  Future<void> _addToFavorites() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final stationId = widget.stationId;

    if (userId != null && stationId != null) {
      try {
        await Supabase.instance.client
            .from('customer_favourite_stations')
            .insert({
          'customer_user_id': userId,
          'filling_station_user_id': stationId,
        });

        setState(() {
          isFavorited = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to favorites!'),
          ),
        );
      } catch (e, s) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add to favorites: $e'),
          ),
        );
      }
    }
  }

  Future<void> _removeFromFavorites() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final stationId = widget.stationId;

    if (userId != null && stationId != null) {
      try {
        final response = await Supabase.instance.client
            .from('customer_favourite_stations')
            .delete()
            .eq('customer_user_id', userId)
            .eq('filling_station_user_id', stationId);

        setState(() {
          isFavorited = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed from favorites!'),
          ),
        );
      } catch (e, s) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to remove from favorites: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: isFavorited ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
