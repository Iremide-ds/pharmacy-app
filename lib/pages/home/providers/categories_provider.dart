import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/drug_category.dart';

class CategoriesProvider extends StateNotifier<List<DrugCategory>> {
  CategoriesProvider()
      : super([
          const DrugCategory(id: 1, name: 'Infants'),
          const DrugCategory(id: 2, name: 'Headache'),
          const DrugCategory(id: 3, name: 'Headache'),
          const DrugCategory(id: 4, name: 'Pain killer')
        ]);
}
