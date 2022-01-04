enum UnitOfMeasurement {
  None,
  Unit,
  Gram,
  Liter,
  Slice,
  TableSpoons,
  TeaSpoons,
  Cups,
}

class Ingredient {
  final String id;
  final String name;
  final UnitOfMeasurement unitOfMeasurement;

  const Ingredient({
    required this.id,
    required this.name,
    required this.unitOfMeasurement,
  });
}
