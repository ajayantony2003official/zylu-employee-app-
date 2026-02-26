import 'package:zylu_employee_app/features/employee/domain/entities/employee.dart';

class EmployeeModel extends Employee {
  const EmployeeModel({
    required super.id,
    required super.name,
    required super.email,
    required super.joiningDate,
    required super.isActive,
    required super.role,
    required super.experienceYears,
    required super.isVeteran,
    super.imageUrl,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      joiningDate: json['joining_date'].toString(),
      isActive: json['is_active'] == true || json['is_active'] == 1,
      role: json['role'],
      experienceYears: json['experience_years'].toString(),
      isVeteran: json['is_veteran'] == true || json['is_veteran'] == 1,
      imageUrl: json['image_url'],
    );
  }
}
