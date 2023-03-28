import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/dimensions.dart';
import '../models/drug_model.dart';
import '../providers/drugs_provider.dart';
import '../../../widgets/product_card.dart';

/// Instantiate provider
final provider = StateNotifierProvider<DrugsProvider, List<Drug>>((ref) => DrugsProvider());

class DrugsFeed extends ConsumerWidget {
  const DrugsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drugsProvider = ref.watch(provider);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.deviceWidth * 0.035),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: AppDimensions.childAspectRatio,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
          ),
          itemCount: drugsProvider.length,
          itemBuilder: (ctx, index) {
            final currentItem = drugsProvider[index];

            return ProductCard(product: currentItem);
          },
        ),
      ),
    );
  }
}
