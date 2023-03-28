import 'package:flutter/material.dart';

@immutable
/// Model of a drug item.
class Drug {
  final int id, categoryId, typeId;
  final String name, imagePath;
  final double mass, price;

  const Drug(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.typeId,
      required this.mass,
      required this.price,
      required this.imagePath});
}
