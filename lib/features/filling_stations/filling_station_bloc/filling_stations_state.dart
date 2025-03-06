part of 'filling_stations_bloc.dart';

@immutable
sealed class FillingStationsState {}

final class FillingStationsInitialState extends FillingStationsState {}

final class FillingStationsLoadingState extends FillingStationsState {}

final class FillingStationsSuccessState extends FillingStationsState {}

final class FillingStationsGetSuccessState extends FillingStationsState {
  final List<Map<String, dynamic>> fillingstations;

  FillingStationsGetSuccessState({required this.fillingstations});
}

final class FillingStationsFailureState extends FillingStationsState {
  final String message;

  FillingStationsFailureState({this.message = apiErrorMessage});
}
