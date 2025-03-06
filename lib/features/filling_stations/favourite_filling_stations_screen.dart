import 'dart:developer';

import 'package:cng_users/features/filling_stations/filling_station_bloc/filling_stations_bloc.dart';
import 'package:cng_users/filling_station_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavouriteFillingStationsScreen extends StatefulWidget {
  const FavouriteFillingStationsScreen({super.key});

  @override
  State<FavouriteFillingStationsScreen> createState() =>
      _FavouriteFillingStationsScreenState();
}

class _FavouriteFillingStationsScreenState
    extends State<FavouriteFillingStationsScreen> {
  FillingStationsBloc _fillingStationsBloc = FillingStationsBloc();

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _fillingStationsBloc.add(GetAllFillingStationsEvent(params: {
      'favourite': true,
    }));
    // _searchController.addListener(() {
    //   if (mounted) {
    //     setState(() {});
    //   }
    //   if (_searchController.text.trim().isEmpty) {
    //     _fillingStationsBloc.add(GetAllFillingStationsEvent(params: {}));
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    _fillingStationsBloc.close();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FillingStationsBloc>.value(
      value: _fillingStationsBloc,
      child: BlocConsumer<FillingStationsBloc, FillingStationsState>(
        listener: (context, stationsState) {
          if (stationsState is FillingStationsFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(stationsState.message)));
          }
          // if (stationsState is FillingStationsGetSuccessState) {
          //   log('${stationsState.fillingstations.first}');
          // }
        },
        builder: (context, stationsState) {
          return ListView(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 20, bottom: 100),
            shrinkWrap: true,
            children: [
              Text(
                'Favourite CNG Stations',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              // const SizedBox(height: 20),
              // //search bar
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: TextField(
              //     controller: _searchController,
              //     onSubmitted: (value) {
              //       _fillingStationsBloc.add(
              //           GetAllFillingStationsEvent(params: {'query': value}));
              //     },
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       border: InputBorder.none,

              //       //clear icon which will clear the search and get all stations
              //       suffixIcon: _searchController.text.trim().isNotEmpty
              //           ? IconButton(
              //               onPressed: () {
              //                 _fillingStationsBloc.add(
              //                   GetAllFillingStationsEvent(
              //                     params: {
              //                       'query': _searchController.text.trim()
              //                     },
              //                   ),
              //                 );
              //               },
              //               icon: const Icon(
              //                 Icons.search,
              //               ),
              //             )
              //           : null,
              //     ),
              //   ),
              // ),

              const SizedBox(height: 20),

              if (stationsState is FillingStationsGetSuccessState &&
                  stationsState.fillingstations.isNotEmpty)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final station = stationsState.fillingstations[index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FillingStationDetails(
                              stationDetails: station,
                            ),
                          ),
                        );

                        _fillingStationsBloc.add(GetAllFillingStationsEvent(
                          params: {},
                        ));
                      },
                      child: Card(
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                station['image_url'],
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.image_not_supported,
                                      color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                station['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      station['address_line'],
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.phone_outlined,
                                      size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    station['phone'],
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.email_outlined,
                                      size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    station['email'],
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.people_outline,
                                      size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Capacity: ${station['capacity']}',
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: stationsState.fillingstations.length,
                )
              else if (stationsState is FillingStationsLoadingState)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: CircularProgressIndicator(),
                ))
              else if (stationsState is FillingStationsInitialState)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: CircularProgressIndicator(),
                ))
              else if (stationsState is FillingStationsFailureState)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('Failed to load stations'),
                ))
              else
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text('No stations found'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
