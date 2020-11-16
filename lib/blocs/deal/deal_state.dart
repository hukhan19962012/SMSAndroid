import 'package:equatable/equatable.dart';

abstract class DealState extends Equatable {

  final List propss;
  DealState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnDealState extends DealState {

  UnDealState();

  @override
  String toString() => 'UnDealState';
}

/// Initialized
class InDealState extends DealState {
  final String hello;

  InDealState(this.hello) : super([hello]);

  @override
  String toString() => 'InDealState $hello';

}

class ErrorDealState extends DealState {
  final String errorMessage;

  ErrorDealState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorDealState';
}
