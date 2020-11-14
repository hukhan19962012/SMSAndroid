import 'package:equatable/equatable.dart';

abstract class DealState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  DealState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  DealState getStateCopy();

  DealState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnDealState extends DealState {

  UnDealState(int version) : super(version);

  @override
  String toString() => 'UnDealState';

  @override
  UnDealState getStateCopy() {
    return UnDealState(0);
  }

  @override
  UnDealState getNewVersion() {
    return UnDealState(version+1);
  }
}

/// Initialized
class InDealState extends DealState {
  final String hello;

  InDealState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InDealState $hello';

  @override
  InDealState getStateCopy() {
    return InDealState(version, hello);
  }

  @override
  InDealState getNewVersion() {
    return InDealState(version+1, hello);
  }
}

class ErrorDealState extends DealState {
  final String errorMessage;

  ErrorDealState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorDealState';

  @override
  ErrorDealState getStateCopy() {
    return ErrorDealState(version, errorMessage);
  }

  @override
  ErrorDealState getNewVersion() {
    return ErrorDealState(version+1, 
    errorMessage);
  }
}
