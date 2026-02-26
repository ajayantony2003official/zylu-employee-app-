import 'package:dartz/dartz.dart';
import 'package:zylu_employee_app/features/employee/data/datasource/employee_remote_datasource.dart';
import 'package:zylu_employee_app/features/employee/domain/entities/employee.dart';
import 'package:zylu_employee_app/features/employee/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;

  EmployeeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<Employee>>> getEmployees() {
    return remoteDataSource.getEmployees();
  }
}