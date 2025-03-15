part of 'records_bloc.dart';

sealed class RecordsState extends Equatable {
  const RecordsState();
}

final class RecordsInitial extends RecordsState {
  @override
  List<Object> get props => [];
}
