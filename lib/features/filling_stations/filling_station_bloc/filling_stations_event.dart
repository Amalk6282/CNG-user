part of 'filling_stations_bloc.dart';

@immutable
sealed class FillingStationsEvent {}

class GetAllFillingStationsEvent extends FillingStationsEvent {
  final Map<String, dynamic> params;

  GetAllFillingStationsEvent({required this.params});
}

class AddFillingStationEvent extends FillingStationsEvent {
  final Map<String, dynamic> fillingstationDetails;

  AddFillingStationEvent({required this.fillingstationDetails});
}

class EditFillingStationEvent extends FillingStationsEvent {
  final Map<String, dynamic> fillingstationDetails;
  final int fillingstationId;

  EditFillingStationEvent({
    required this.fillingstationDetails,
    required this.fillingstationId,
  });
}

class DeleteFillingStationEvent extends FillingStationsEvent {
  final int fillingstationId;

  DeleteFillingStationEvent({required this.fillingstationId});
}
