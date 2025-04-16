class Denomination {
  int denomination;
  int quantity;

  Denomination({required this.denomination, this.quantity = 0});

  int get total => denomination * quantity;

  Map<String, dynamic> toJson() => {
        'denomination': denomination,
        'quantity': quantity,
        'total': total,
      };
}
