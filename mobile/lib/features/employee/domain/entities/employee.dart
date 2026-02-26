import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int id;
  final String name;
  final String email;
  final String joiningDate;
  final bool isActive;
  final String role;
  final String experienceYears;
  final bool isVeteran;
  final String? imageUrl;

  const Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.joiningDate,
    required this.isActive,
    required this.role,
    required this.experienceYears,
    required this.isVeteran,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    joiningDate,
    isActive,
    role,
    experienceYears,
    isVeteran,
    imageUrl,
  ];
}
