import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/dimensions.dart';
import '../models/drug_category.dart';
import '../providers/categories_provider.dart';

final provider = StateNotifierProvider<CategoriesProvider, List<DrugCategory>>((ref) => CategoriesProvider());

class CategoriesFeed extends ConsumerWidget {
  const CategoriesFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DrugCategory> categoriesProvider = ref.read(provider);

    return SizedBox(
      height: AppDimensions.deviceHeight * 0.13,
      width: AppDimensions.deviceWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesProvider.length,
        itemBuilder: (ctx, index) {
          final currentIndex = categoriesProvider[index];

          return CategoryCard(
            category: currentIndex,
            isLast: (index == (categoriesProvider.length - 1)),
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final DrugCategory category;
  final bool isLast;

  const CategoryCard({Key? key, required this.category, required this.isLast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: isLast
          ? const EdgeInsets.symmetric(horizontal: 10)
          : const EdgeInsets.only(left: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius2)),
      child: Stack(
        children: [
          Container(
            width: AppDimensions.deviceWidth * 0.35,
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius:
                    BorderRadius.circular(AppDimensions.borderRadius2)),
            child: Center(
                child: Text(
              category.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.fontSize5,
                  fontWeight: FontWeight.w700),
            ),),
          ),
          //todo: add image
        ],
      ),
    );
  }
}
