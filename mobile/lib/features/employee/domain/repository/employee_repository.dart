import 'package:zylu_employee_app/features/employee/domain/entities/employee.dart';
import 'package:dartz/dartz.dart';

abstract class EmployeeRepository {
  Future<Either<Exception, List<Employee>>> getEmployees();
}
