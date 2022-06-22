import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String refresh;
  final String access;
  final String obtain;

  TokenEntity(this.refresh, this.access, this.obtain);

  @override
  List<Object?> get props => [refresh, access];
}