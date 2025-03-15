part of 'scan_bloc.dart';

// Enum
/// Enum that represents the status of the scan.
enum ScanStatus { initial, inProgress, completed, failed }

/// State: ScanState
class ScanState extends Equatable {
  /// State that stores the status of the scan.
  const ScanState({
    this.status = ScanStatus.initial,
    this.scanResult,
    this.errorMessage,
  });

  // Attribute
  /// The status of the scan.
  final ScanStatus status;

  // Attribute
  /// The results of the scan.
  final String? scanResult;

  // Attribute
  /// Error message if the scan fails.
  final String? errorMessage;

  // Method: props
  @override
  List<Object> get props => [status];

  // Method: copyWith
  ScanState copyWith({
    ScanStatus? status,
    String? scanResult,
    String? errorMessage,
  }) =>
      ScanState(
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        scanResult: scanResult ?? this.scanResult,
      );
}
