import 'package:dartz/dartz.dart';
import 'package:zylu_employee_app/core/network/api_client.dart';
import 'package:zylu_employee_app/features/employee/data/models/employee_model.dart';

class EmployeeRemoteDataSource {
  final ApiClient client;

  EmployeeRemoteDataSource(this.client);

  Future<Either<Exception, List<EmployeeModel>>> getEmployees() async {
    try {
      final response = await client.get('/employees');

      final List list = response['data'];

      return right(list.map((e) => EmployeeModel.fromJson(e)).toList());
    } catch (e) {
      return left(e as Exception);
    }
  }
}
