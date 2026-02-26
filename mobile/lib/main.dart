import 'package:flutter/material.dart';
import 'package:zylu_employee_app/core/theme/light_theme.dart';
import 'package:zylu_employee_app/features/employee/presentation/pages/employee_list_page.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator
  await init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zylu Employee App',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      home: const EmployeeListPage(),
    );
  }
}
