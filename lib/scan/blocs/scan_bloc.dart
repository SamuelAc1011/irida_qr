import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'scan_event.dart';

part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(const ScanState()) {
    on<ScanStarted>(_onScanStarted);

    on<ScanCompleted>(_onScanCompleted);

    on<ScanFailed>(_onScanFailed);
  }

  // Attribute
  /// Logger instance that will be used to log messages from the bloc.
  final Logger _logger = Logger();

  // StreamSubscription<Object?>? _subscription;

  @override
  void onChange(Change<ScanState> change) {
    _logger.t('''
    Scan Bloc
    
    Status: ${change.nextState.status}
    Result: ${change.nextState.scanResult}
    Error: ${change.nextState.errorMessage}''');
    super.onChange(change);
  }

  // Method: _onScanStarted
  /// Method that will be called when the [ScanStarted] event is emitted.
  void _onScanStarted(ScanStarted event, Emitter<ScanState> emit) =>
      emit(state.copyWith(status: ScanStatus.inProgress));

  void _onScanCompleted(ScanCompleted event, Emitter<ScanState> emit) {
    emit(
      state.copyWith(
        scanResult: event.scanResult,
        status: ScanStatus.completed,
      ),
    );
    _logger.i('QR: ${event.scanResult}');
  }

  void _onScanFailed(ScanFailed event, Emitter<ScanState> emit) {
    emit(state.copyWith(status: ScanStatus.failed));
  }
}
