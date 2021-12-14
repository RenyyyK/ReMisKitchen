import 'dart:ffi';

enum UnitOfMeasurement { None, Unit, Gram, Liter, Slice, TableSpoon }

class Ingredient {
  final String id;
  final String name;
  final UnitOfMeasurement unitOfMeasurement;
  final double quantity;
  final String extraDetails;

  const Ingredient({
    required this.id,
    required this.name,
    required this.unitOfMeasurement,
    required this.quantity,
    required this.extraDetails
  });
}