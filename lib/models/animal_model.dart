class AnimalModel {
  final String id;
  final String name;
  int? purchased;
  int? mined;
  int? count;
  double? price;
  int? input;

  AnimalModel({
    required this.id,
    required this.name,
    this.purchased = 0,
    this.mined = 0,
    this.count = 0,
    this.price = 0,
    this.input = 0,
  });
}
