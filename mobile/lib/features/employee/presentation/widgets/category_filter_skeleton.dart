import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryFilterSkeleton extends StatelessWidget {
  const CategoryFilterSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,

      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4, // number of skeleton chips

          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: const Center(
                  child: SizedBox(
                    width: 40,
                    height: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}