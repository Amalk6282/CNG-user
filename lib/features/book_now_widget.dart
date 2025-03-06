import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookNowDialog extends StatefulWidget {
  final String fillingStationUserId;

  BookNowDialog({required this.fillingStationUserId});

  @override
  _BookNowDialogState createState() => _BookNowDialogState();
}

class _BookNowDialogState extends State<BookNowDialog> {
  DateTime? _selectedDateTime;
  final TextEditingController _cngKgController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Book Now'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(_selectedDateTime == null
                ? 'Select Date and Time'
                : DateFormat('yyyy-MM-dd – kk:mm').format(_selectedDateTime!)),
            trailing: Icon(Icons.calendar_today),
            onTap: _pickDateTime,
          ),
          TextField(
            controller: _cngKgController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'CNG (kg)'),
          ),
        ],
      ),
      actions: isLoading
          ? [const LinearProgressIndicator()]
          : [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
    );
  }

  Future<void> _pickDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 3)),
    );

    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          _selectedDateTime =
              DateTime(date.year, date.month, date.day, time.hour, time.minute);
        });
      }
    }
  }

  void _submit() async {
    if (_selectedDateTime != null &&
        _cngKgController.text.trim().isNotEmpty &&
        int.tryParse(_cngKgController.text.trim()) != null) {
      // Save to database
      // You can implement the database saving logic here

      //

      try {
        isLoading = true;
        setState(() {});
        await Supabase.instance.client.rpc('book_now', params: {
          'k_filling_station_user_id': widget.fillingStationUserId,
          'k_required_quantity': int.parse(_cngKgController.text.toString()),
          'date_time': _selectedDateTime!.toIso8601String(),
        });
        isLoading = false;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Booking Successfull')),
        );
        Navigator.of(context).pop();
      } catch (e, s) {
        isLoading = false;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e')),
        );
        Navigator.of(context).pop();
      }
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields properly')),
      );
    }
  }
}
