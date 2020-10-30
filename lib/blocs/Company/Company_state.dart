import 'package:equatable/equatable.dart';

abstract class CompanyState extends Equatable {

  final List propss;
  CompanyState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnCompanyState extends CompanyState {

  UnCompanyState();

  @override
  String toString() => 'UnCompanyState';
}

/// Initialized
class InCompanyState extends CompanyState {
  final String hello;

  InCompanyState(this.hello) : super([hello]);

  @override
  String toString() => 'InCompanyState $hello';

}

class ErrorCompanyState extends CompanyState {
  final String errorMessage;

  ErrorCompanyState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorCompanyState';
}
