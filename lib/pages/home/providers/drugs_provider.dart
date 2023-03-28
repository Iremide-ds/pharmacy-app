import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/assets_manager.dart';
import '../models/drug_model.dart';

class DrugsProvider extends StateNotifier<List<Drug>> {
  DrugsProvider()
      : super([
          const Drug(
              id: 1,
              categoryId: 1,
              name: 'Paracetamol',
              typeId: 1,
              mass: 500,
              price: 600,
              imagePath: AppImages.paracetamolPNG),
          const Drug(
              id: 2,
              categoryId: 2,
              name: 'Panadol',
              typeId: 1,
              mass: 500,
              price: 600,
              imagePath: AppImages.panadolPNG),
          const Drug(
              id: 3,
              categoryId: 1,
              name: 'Doliprane',
              typeId: 2,
              mass: 500,
              price: 600,
              imagePath: AppImages.dolipranePNG),
          const Drug(
              id: 4,
              categoryId: 3,
              name: 'Ibuprofen',
              typeId: 1,
              mass: 200,
              price: 600,
              imagePath: AppImages.ibuprofenPNG),
          const Drug(
              id: 5,
              categoryId: 1,
              name: 'Ibuprofen',
              typeId: 1,
              mass: 500,
              price: 600,
              imagePath: AppImages.ibuprofen2PNG),
          const Drug(
              id: 6,
              categoryId: 2,
              name: 'Paracetamol',
              typeId: 1,
              mass: 100,
              price: 600,
              imagePath: AppImages.paracetamol2PNG),
          const Drug(
              id: 7,
              categoryId: 4,
              name: 'Paracetamol',
              typeId: 1,
              mass: 550,
              price: 600,
              imagePath: AppImages.paracetamol2PNG),
        ]);
}
