
import 'package:remi_kitchen/models/ingredient.dart';

class Measurement {
  final Ingredient ingredient;
  final double quantity;
  final String extraDetails;

  const Measurement(
      {required this.ingredient,
      required this.quantity,
      required this.extraDetails});
}
