part of 'sync_bloc.dart';

abstract class SyncState extends Equatable {
  const SyncState();
  @override
  List<Object> get props => [];
}

class Initial extends SyncState {}
class Loading extends SyncState {}
class Success extends SyncState {}
class Error extends SyncState {}
