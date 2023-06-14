import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 신버전
final sampleStateNotifierProvider1 = StateNotifierProvider<NetworkNotifier1, NetworkState>((ref) {
  return NetworkNotifier1(ref);
});

class NetworkNotifier1 extends StateNotifier<NetworkState> {
  NetworkNotifier1(this.ref) : super(NetworkState.initial);

  final Ref ref;

  void method() {

  }
}

enum NetworkState {
  initial,
  success,
  failure,
}

class NetworkStates<T> extends Equatable {
  final NetworkState? previous;
  final NetworkState status;
  final String? message;

  const NetworkStates({
    this.previous,
    this.status = NetworkState.initial,
    this.message,
  });

  @override
  List<Object?> get props => [previous, status, message];

  NetworkStates copyWith({
    NetworkState? status,
    T? data,
    String? message,
  }) {
    return NetworkStates(
      previous: previous ?? this.previous,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

// -----------------------------------------------------------------------------------------------------

// 구버전
// final sampleStateNotifierProvider2 = StateNotifierProvider<NetworkNotifier2, NetworkState>((ref) {
//   return NetworkNotifier2(ref);
// });

// class NetworkNotifier2 extends StateNotifier<NetworkState> {
//   NetworkNotifier2(this.ref) : super(const NetworkInitial());

//   final Ref ref;

//   void method() {}
// }

// abstract class NetworkState extends Equatable {
//   const NetworkState(this.previous);

//   final NetworkState? previous;
// }

// class NetworkInitial extends NetworkState {
//   const NetworkInitial() : super(null);

//   @override
//   List<Object?> get props => [];
// }

// class NetworkSuccess extends NetworkState {
//   const NetworkSuccess(super.previous);

//   @override
//   List<Object?> get props => [previous];
// }

// class NetworkFailure extends NetworkState {
//   final String message;
//   const NetworkFailure(super.previous, this.message);

//   @override
//   List<Object?> get props => [previous, message];
// }
