import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/drug_model.dart';
import 'drugs_provider.dart';

/// Instantiate provider
final provider = StateNotifierProvider<DrugsProvider, List<Drug>>((ref) => DrugsProvider());

class FilterProvider extends StateNotifier<List<Drug>> {
  FilterProvider() : super([]);
}
