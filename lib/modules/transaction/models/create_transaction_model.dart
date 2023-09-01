class CreateTransactionsModel {
  dynamic value;
  int? accountId;

  CreateTransactionsModel({this.value, this.accountId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['accountId'] = accountId;
    return data;
  }
}
