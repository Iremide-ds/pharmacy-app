import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/drugs_provider.dart';
import 'providers/prompt_provider.dart';
import 'providers/filter_provider.dart';
import '../../core/dimensions.dart';
import '../../core/assets_manager.dart';
import 'models/drug_model.dart';
import 'features/drug_feed.dart';
import 'features/categories_list.dart';
import 'features/search_feed.dart';
import '../../widgets/custom_app_bar.dart';

final filterProvider = StateNotifierProvider<FilterProvider, List<Drug>>(
    (ref) => FilterProvider());
final drugsProvider =
    StateNotifierProvider<DrugsProvider, List<Drug>>((ref) => DrugsProvider());
final promptProvider =
    StateNotifierProvider<PromptProvider, String>((ref) => PromptProvider());

final provider = Provider<List<Drug>>((ref) {
  final filter = ref.watch(filterProvider);
  final drugs = ref.watch(drugsProvider);
  final prompt = ref.watch(promptProvider);

  if (prompt.isEmpty) return [];

  /// clears then adds results to [_filteredItems].
  debugPrint('search prompt -  $prompt');

  filter.clear();
  filter.addAll(drugs.where((element) {
    return element.name.contains(prompt);
  }));
  debugPrint('search results - ${filter.length}');

  return filter;
});

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _navBarItems = [
    {'label': 'Home', 'icon': AppImages.homeSVG, 'action': () {}},
    {'label': 'Doctors', 'icon': AppImages.doctorsSVG, 'action': () {}},
    {'label': 'Pharmacy', 'icon': AppImages.pharmacySVG, 'action': () {}},
    {'label': 'Community', 'icon': AppImages.communitySVG, 'action': () {}},
    {'label': 'Profile', 'icon': AppImages.profileSVG, 'action': () {}},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(provider);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// App bar
            CustomAppBar(
              canCancel: false,
              showDelivery: true,
              searchController: _searchController,
              height: AppDimensions.height1,
              width: AppDimensions.deviceWidth,
              title: const Text(
                'Pharmacy',
                style: TextStyle(
                    fontSize: AppDimensions.fontSize1,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              suffix: SvgPicture.asset(AppImages.zoomingCarSVG),
            ),
            Visibility(
                visible: filterProvider.isNotEmpty,
                child: const Expanded(child: SearchResults())),
            Visibility(
              visible: filterProvider.isEmpty,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'CATEGORIES',
                            style: TextStyle(
                                fontSize: AppDimensions.fontSize3,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () {
                              // todo: go to categories page
                            },
                            child: const Text(
                              'VIEW ALL',
                              style: TextStyle(
                                  fontSize: AppDimensions.fontSize3,
                                  color: Color(0xff9f5de2),
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    const CategoriesFeed(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.deviceHeight * 0.02,
                          horizontal: 10),
                      child: const Text(
                        'SUGGESTIONS',
                        style: TextStyle(
                            fontSize: AppDimensions.fontSize3,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const DrugsFeed(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius3),
              side: const BorderSide(color: Colors.white),
            ),
            elevation: 8.0,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.black38,
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            //todo: go to cart
          },
          child: Container(
            constraints:
                BoxConstraints(minHeight: AppDimensions.deviceHeight * 0.06),
            padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.deviceWidth * 0.06),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius3),
              gradient: const LinearGradient(
                colors: [Color(0xfffe806f), Color(0xffe5366a)],
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: _searchController.text.isEmpty,
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.fontSize4,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.deviceWidth * 0.02),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
                Visibility(
                  visible: _searchController.text.isEmpty,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff2c94c),
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.fontSize5),
                    ),
                  ),
                )
              ],
            ),
          )),
      bottomNavigationBar: Container(
        height: AppDimensions.deviceHeight * 0.09,
        width: AppDimensions.deviceWidth,
        color: const Color(0xffeeebf1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _navBarItems.map((currentIndex) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(currentIndex['icon']),
                Text(currentIndex['label']),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
