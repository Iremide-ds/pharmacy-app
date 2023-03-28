import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/drug_type.dart';

class TypesProvider extends StateNotifier {
  TypesProvider()
      : super([
          const DrugType(id: 1, name: 'Tablet'),
          const DrugType(id: 2, name: 'Capsule')
        ]);
}
