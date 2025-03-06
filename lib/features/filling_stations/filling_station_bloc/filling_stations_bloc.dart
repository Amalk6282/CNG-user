import 'package:bloc/bloc.dart';
import 'package:logger/web.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../util/file_upload.dart';
import '../../../values/strings.dart';

part 'filling_stations_event.dart';
part 'filling_stations_state.dart';

class FillingStationsBloc
    extends Bloc<FillingStationsEvent, FillingStationsState> {
  FillingStationsBloc() : super(FillingStationsInitialState()) {
    on<FillingStationsEvent>((event, emit) async {
      try {
        emit(FillingStationsLoadingState());
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder table = supabaseClient.from('filling_stations');

        if (event is GetAllFillingStationsEvent) {
          PostgrestFilterBuilder<List<Map<String, dynamic>>> query =
              table.select('*');

          if (event.params['query'] != null) {
            String qString = event.params['query'].toString();
            query = query.or(
                'name.ilike.%$qString%, address_line.ilike.%$qString%, place.ilike.%$qString%, state.ilike.%$qString%');
          }

          List<Map<String, dynamic>> fillingstations =
              await query.order('name', ascending: true);

          emit(
              FillingStationsGetSuccessState(fillingstations: fillingstations));
        } else if (event is AddFillingStationEvent) {
          final response = await supabaseClient.auth.admin.createUser(
            AdminUserAttributes(
              email: event.fillingstationDetails['email'],
              password: event.fillingstationDetails['password'],
              emailConfirm: true,
              appMetadata: {"role": "station"},
            ),
          );
          event.fillingstationDetails.remove('password');
          event.fillingstationDetails['image_url'] = await uploadFile(
            'fillingstations/image',
            event.fillingstationDetails['image'],
            event.fillingstationDetails['image_name'],
          );
          event.fillingstationDetails.remove('image');
          event.fillingstationDetails.remove('image_name');
          event.fillingstationDetails['user_id'] = response.user?.id;
          await table.insert(event.fillingstationDetails);

          emit(FillingStationsSuccessState());
        } else if (event is EditFillingStationEvent) {
          event.fillingstationDetails.remove('email');
          event.fillingstationDetails.remove('password');
          if (event.fillingstationDetails['image'] != null) {
            event.fillingstationDetails['image_url'] = await uploadFile(
              'fillingstations/image',
              event.fillingstationDetails['image'],
              event.fillingstationDetails['image_name'],
            );
            event.fillingstationDetails.remove('image');
            event.fillingstationDetails.remove('image_name');
          }
          await table
              .update(event.fillingstationDetails)
              .eq('id', event.fillingstationId);

          emit(FillingStationsSuccessState());
        } else if (event is DeleteFillingStationEvent) {
          await table.delete().eq('id', event.fillingstationId);
          emit(FillingStationsSuccessState());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(FillingStationsFailureState());
      }
    });
  }
}
