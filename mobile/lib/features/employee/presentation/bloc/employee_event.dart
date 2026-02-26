import 'package:equatable/equatable.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object?> get props => [];
}

class FetchEmployees extends EmployeeEvent {}

class FilterEmployees extends EmployeeEvent {
  final String category;
  final String? query;

  const FilterEmployees({required this.category, this.query});

  @override
  List<Object?> get props => [category, query];
}

