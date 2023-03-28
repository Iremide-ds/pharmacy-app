import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/core/dimensions.dart';

import '../pages/home/providers/drugs_provider.dart';
import '../pages/home/models/drug_model.dart';

/// Instantiate provider
final provider = StateNotifierProvider<DrugsProvider, List<Drug>>((ref) => DrugsProvider());

class ProductCard extends ConsumerWidget {
  final Drug product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drugsProvider = ref.watch(provider);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius2),
      ),
      elevation: 22.0,
      shadowColor: Colors.black26,
      surfaceTintColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.borderRadius2),
                  topRight: Radius.circular(AppDimensions.borderRadius2),
                ),
                image: DecorationImage(
                    image: AssetImage(product.imagePath), fit: BoxFit.cover),
              ),
              margin: const EdgeInsets.only(bottom: 11.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: AppDimensions.fontSize3,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${drugsProvider.firstWhere((element) {
                    return element.id == product.typeId;
                  }).name} · ${product.mass.round()}mg',
                  style: const TextStyle(
                      fontSize: AppDimensions.fontSize4,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '₦${product.price.round()}',
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSize2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
