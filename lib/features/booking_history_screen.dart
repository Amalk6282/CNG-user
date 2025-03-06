import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 100),
      shrinkWrap: true,
      children: [
        Text(
          'My Bookngs',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        FutureBuilder(
            future: Supabase.instance.client
                .from('bookings')
                .select('*, filling_stations(*)')
                .eq('customer_uer_id',
                    Supabase.instance.client.auth.currentUser!.id)
                .order('created_at', ascending: false),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error fetching bookings'));
              }
              if (snapshot.data == null) {
                return const Center(child: Text('No bookings found'));
              }
              List<Map<String, dynamic>> bookings = snapshot.data!;
              log(bookings.first.toString());
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BookingCard(
                  booking: bookings[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: bookings.length,
              );
            })
      ],
    );
  }
}

class BookingCard extends StatelessWidget {
  final Map<String, dynamic> booking;
  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final station = booking['filling_stations'];
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station['name'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Booking Date: ${DateTime.parse(booking['booking_date_time']).toLocal()}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Required Quantity: ${booking['required_quantity']} kg',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${booking['booking_status']}',
              style: TextStyle(
                fontSize: 16,
                color: booking['booking_status'] == 'Pending'
                    ? Colors.orange
                    : Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Address: ${station['address_line']}, ${station['place']}, ${station['district']}, ${station['state']}, ${station['pincode']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                station['image_url'],
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
