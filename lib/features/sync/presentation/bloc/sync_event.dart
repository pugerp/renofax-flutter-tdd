part of 'sync_bloc.dart';

abstract class SyncEvent extends Equatable {
  const SyncEvent();
}

class syncData extends SyncEvent {
  final List<String> syncEvent;

  syncData({required this.syncEvent});

  @override
  List<Object?> get props => [syncEvent];

}
