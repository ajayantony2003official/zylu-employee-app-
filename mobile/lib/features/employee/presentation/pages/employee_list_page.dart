import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zylu_employee_app/core/di/service_locator.dart';
import 'package:zylu_employee_app/core/widgets/dismiss_keyboard.dart';
import 'package:zylu_employee_app/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:zylu_employee_app/features/employee/presentation/bloc/employee_event.dart';
import 'package:zylu_employee_app/features/employee/presentation/bloc/employee_state.dart';
import 'package:zylu_employee_app/features/employee/presentation/widgets/category_filter_skeleton.dart';
import 'package:zylu_employee_app/features/employee/presentation/widgets/employee_card.dart';
import 'package:zylu_employee_app/features/employee/presentation/widgets/employee_card_skeleton.dart';
import 'package:zylu_employee_app/features/employee/presentation/widgets/search_bar_skeleton.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  final List<String> categories = ['All', 'Flagged', 'Active', 'Inactive'];
  int selectedIndex = 0;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: BlocProvider(
        create: (context) => sl<EmployeeBloc>()..add(FetchEmployees()),
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 74, // increase height
                title: const Text(
                  'Employee List',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: BlocBuilder<EmployeeBloc, EmployeeState>(
                    builder: (context, state) {
                      if (state is EmployeeLoading) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: const SearchBarSkeleton(),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            controller: searchController,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              hintText: "Search employee by name",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                            ),
                            onChanged: (value) {
                              context.read<EmployeeBloc>().add(
                                FilterEmployees(
                                  query: value,
                                  category: categories[selectedIndex],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              body: BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  if (state is EmployeeLoading) {
                    return ListView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0,
                          ),
                          child: const CategoryFilterSkeleton(),
                        ),

                        ...List.generate(20, (i) {
                          return Padding(
                            padding: .only(
                              bottom: 20 == i
                                  ? MediaQuery.of(context).padding.bottom + 16
                                  : 8,
                            ),
                            child: EmployeeCardSkeleton(),
                          );
                        }),
                      ],
                    );
                  }

                  if (state is EmployeeLoaded) {
                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        // Filter Bar (scrolls with list)
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (_, i) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      selectedIndex = i;
                                    });
                                    context.read<EmployeeBloc>().add(
                                      FilterEmployees(
                                        category: categories[i],
                                        query: searchController.text.trim(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: selectedIndex == i
                                          ? Color(0xFF157FEC).withOpacity(0.1)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: selectedIndex != i
                                          ? Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1,
                                            )
                                          : null,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Center(
                                      child: Text(
                                        categories[i],
                                        style: TextStyle(
                                          color: selectedIndex == i
                                              ? Color(0xFF157FEC)
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // Employee List
                        ...List.generate(state.employees.length, (i) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: state.employees.length - 1 == i
                                  ? MediaQuery.of(context).padding.bottom + 16
                                  : 8,
                            ),
                            child: EmployeeCard(employee: state.employees[i]),
                          );
                        }),
                      ],
                    );
                  }

                  return Container();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
