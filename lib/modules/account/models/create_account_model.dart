class CreateAccountModel {
  String? name;
  String? lastName;
  int? initialBalance;

  CreateAccountModel({this.name, this.lastName, this.initialBalance});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lastName'] = lastName;
    data['initialBalance'] = initialBalance;
    return data;
  }
}
