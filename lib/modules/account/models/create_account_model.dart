class CreateAccountModel {
  String? name;
  String? lastName;
  double? initialBalance;

  CreateAccountModel(
      {required this.name,
      required this.lastName,
      required this.initialBalance});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lastName'] = lastName;
    data['initialBalance'] = initialBalance;
    return data;
  }
}
