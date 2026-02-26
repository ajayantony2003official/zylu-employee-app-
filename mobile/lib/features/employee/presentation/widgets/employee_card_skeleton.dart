import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeCardSkeleton extends StatelessWidget {
  const EmployeeCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,

        child: ListTile(
          leading: Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),

          // Name + Veteran badge
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 14, width: 140, color: Colors.white),

              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),

          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),

              // Role
              Container(height: 12, width: 120, color: Colors.white),

              const SizedBox(height: 6),

              // Since + experience row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 12, width: 100, color: Colors.white),

                  Container(height: 12, width: 130, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
