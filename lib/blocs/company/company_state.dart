import 'package:equatable/equatable.dart';

abstract class CompanyState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  CompanyState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  CompanyState getStateCopy();

  CompanyState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnCompanyState extends CompanyState {

  UnCompanyState(int version) : super(version);

  @override
  String toString() => 'UnCompanyState';

  @override
  UnCompanyState getStateCopy() {
    return UnCompanyState(0);
  }

  @override
  UnCompanyState getNewVersion() {
    return UnCompanyState(version+1);
  }
}

/// Initialized
class InCompanyState extends CompanyState {
  final String hello;

  InCompanyState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InCompanyState $hello';

  @override
  InCompanyState getStateCopy() {
    return InCompanyState(version, hello);
  }

  @override
  InCompanyState getNewVersion() {
    return InCompanyState(version+1, hello);
  }
}

class ErrorCompanyState extends CompanyState {
  final String errorMessage;

  ErrorCompanyState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorCompanyState';

  @override
  ErrorCompanyState getStateCopy() {
    return ErrorCompanyState(version, errorMessage);
  }

  @override
  ErrorCompanyState getNewVersion() {
    return ErrorCompanyState(version+1, 
    errorMessage);
  }
}
