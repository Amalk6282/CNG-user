import 'package:cng_users/features/booking_confirmation_screen.dart';
import 'package:flutter/material.dart';

class SlotBookingScreen extends StatefulWidget {
  const SlotBookingScreen({Key? key}) : super(key: key);

  @override
  State<SlotBookingScreen> createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  DateTime selectedDate = DateTime.now();
  String? selectedFuelStation;
  String? selectedTimeSlot;
  final List<String> fuelStations = [
    'CNG Station - Downtown',
    'Green Fuel CNG - North',
    'EcoFuel CNG Station - East',
    'Metro CNG Station - West',
    'Highway CNG Point - South',
  ];

  final List<String> timeSlots = [
    '08:00 - 08:30 AM',
    '08:30 - 09:00 AM',
    '09:00 - 09:30 AM',
    '09:30 - 10:00 AM',
    '10:00 - 10:30 AM',
    '10:30 - 11:00 AM',
    '11:00 - 11:30 AM',
    '11:30 - 12:00 PM',
    '12:00 - 12:30 PM',
    '12:30 - 01:00 PM',
    '01:00 - 01:30 PM',
    '01:30 - 02:00 PM',
    '02:00 - 02:30 PM',
    '02:30 - 03:00 PM',
    '03:00 - 03:30 PM',
    '03:30 - 04:00 PM',
    '04:00 - 04:30 PM',
    '04:30 - 05:00 PM',
    '05:00 - 05:30 PM',
    '05:30 - 06:00 PM',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            colorScheme: const ColorScheme.light(primary: Colors.green),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book CNG Slot'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Station',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: fuelStations.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: selectedFuelStation == fuelStations[index]
                          ? Colors.green
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedFuelStation = fuelStations[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2311/2311636.png',
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fuelStations[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${2 + index} km away',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            selectedFuelStation == fuelStations[index]
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: selectedFuelStation == fuelStations[index]
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Time Slot',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                final isSelected = selectedTimeSlot == timeSlots[index];
                final isAvailable =
                    index % 3 != 0; // Simulating some slots as booked

                return InkWell(
                  onTap: isAvailable
                      ? () {
                          setState(() {
                            selectedTimeSlot = timeSlots[index];
                          });
                        }
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: !isAvailable
                          ? Colors.grey[200]
                          : isSelected
                              ? Colors.green.withOpacity(0.2)
                              : Colors.white,
                      border: Border.all(
                        color: isSelected ? Colors.green : Colors.grey[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      timeSlots[index],
                      style: TextStyle(
                        color: !isAvailable
                            ? Colors.grey[500]
                            : isSelected
                                ? Colors.green
                                : Colors.black87,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    (selectedFuelStation != null && selectedTimeSlot != null)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookingConfirmationScreen()),
                            );
                          }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: const Text(
                  'Book Slot',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
