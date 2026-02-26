import 'package:zylu_employee_app/features/employee/domain/entities/employee.dart';
import 'package:zylu_employee_app/features/employee/domain/repository/employee_repository.dart';
import 'package:dartz/dartz.dart';

class GetEmployees {
  final EmployeeRepository repository;

  GetEmployees(this.repository);

  Future<Either<Exception, List<Employee>>> call() async {
    return await repository.getEmployees();
  }
}
