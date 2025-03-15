import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'records_event.dart';

part 'records_state.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc() : super(RecordsInitial()) {
    on<RecordsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
