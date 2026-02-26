import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zylu_employee_app/features/employee/domain/entities/employee.dart';
import 'package:zylu_employee_app/features/employee/domain/usecases/get_employees.dart';
import 'package:zylu_employee_app/features/employee/presentation/bloc/employee_event.dart';
import 'package:zylu_employee_app/features/employee/presentation/bloc/employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployees getEmployees;

  // cache variable
  List<Employee> _allEmployees = [];

  EmployeeBloc(this.getEmployees) : super(EmployeeInitial()) {
    on<FetchEmployees>(_onFetchEmployees);
    on<FilterEmployees>(_onFilterEmployees);
  }

  Future<void> _onFetchEmployees(
    FetchEmployees event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());
    try {
      final result = await getEmployees.call();
      result.fold((failure) => emit(EmployeeError(failure.toString())), (
        employees,
      ) {
        _allEmployees = employees;
        emit(EmployeeLoaded(employees));
      });
    } catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }

  Future<void> _onFilterEmployees(
    FilterEmployees event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());

    final query = event.query?.toLowerCase() ?? "";

    List<Employee> filtered;
    switch (event.category.toLowerCase()) {
      case 'flagged':
        filtered = _allEmployees
            .where((e) => e.isVeteran && e.isActive)
            .toList();
        break;
      case 'active':
        filtered = _allEmployees.where((e) => e.isActive).toList();
        break;
      case 'inactive':
        filtered = _allEmployees.where((e) => !e.isActive).toList();
        break;
      default:
        filtered = _allEmployees;
        break;
    }

    if (query.isNotEmpty) {
      filtered = filtered.where((e) {
        return e.name.toLowerCase().contains(query) ||
            e.role.toLowerCase().contains(query);
      }).toList();
    }

    emit(EmployeeLoaded(filtered));
  }
}
