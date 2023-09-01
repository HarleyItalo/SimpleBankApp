class AllTransactionsModel {
  int? status;
  String? message;
  List<Transactions>? transactions;

  AllTransactionsModel({this.status, this.message, this.transactions});

  AllTransactionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  int? transactionId;
  String? transactionType;
  dynamic value;
  String? createdAt;

  Transactions(
      {this.transactionId, this.transactionType, this.value, this.createdAt});

  Transactions.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    transactionType = json['transactionType'];
    value = json['value'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['transactionType'] = transactionType;
    data['value'] = value;
    data['createdAt'] = createdAt;
    return data;
  }
}
