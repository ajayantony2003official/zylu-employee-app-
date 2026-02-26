import 'package:flutter/material.dart';
import 'package:zylu_employee_app/features/employee/domain/entities/employee.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      padding: const .symmetric(vertical: 10),
      child: ListTile(
        leading: Stack(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 28,
              backgroundImage: employee.imageUrl != null
                  ? NetworkImage(employee.imageUrl!)
                  : null,
              child: employee.imageUrl == null
                  ? const Icon(Icons.person, color: Colors.black)
                  : null,
            ),

            // Status Dot
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white, // border color
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: employee.isActive ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              employee.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            if (employee.isVeteran)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: Icon(
                  Icons.workspace_premium,
                  color: Colors.green,
                  size: 18,
                ),
              ),
          ],
        ),

        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              employee.role,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Since ${employee.joiningDate}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),

                Text(
                  '${employee.experienceYears} yrs of experience',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
