part of 'scan_bloc.dart';

sealed class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object> get props => [];
}

// Event: ScanStarted
/// Event that is emitted when the scan is started.
class ScanStarted extends ScanEvent {}

// Event: ScanCompleted
/// Event that is emitted when the scan is completed successfully
/// and the scan results are available.
class ScanCompleted extends ScanEvent {
  /// Constructor
  const ScanCompleted(this.scanResult);

  // Attribute
  /// The results of the scan.
  final String scanResult;

  @override
  List<Object> get props => [scanResult];
}

// Event: ScanFailed
/// Event that is emitted when the scan fails.
class ScanFailed extends ScanEvent {}
