class BalanceModel {
  int? status;
  String? message;
  double? balance;

  BalanceModel({this.status, this.message, this.balance});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['balance'] != null) balance = json['balance'] * 1.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['balance'] = balance;
    return data;
  }
}
