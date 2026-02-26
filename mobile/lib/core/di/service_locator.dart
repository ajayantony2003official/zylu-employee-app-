import 'package:get_it/get_it.dart';
import 'package:zylu_employee_app/core/network/api_client.dart';
import 'package:zylu_employee_app/features/employee/data/datasource/employee_remote_datasource.dart';
import 'package:zylu_employee_app/features/employee/data/repository/employee_repository_impl.dart';
import 'package:zylu_employee_app/features/employee/domain/repository/employee_repository.dart';
import 'package:zylu_employee_app/features/employee/domain/usecases/get_employees.dart';
import 'package:zylu_employee_app/features/employee/presentation/bloc/employee_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ApiClient());

  // Data source
  sl.registerLazySingleton(() => EmployeeRemoteDataSource(sl()));

  // Repository
  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => GetEmployees(sl()));

  // Bloc
  sl.registerFactory(() => EmployeeBloc(sl()));
}
