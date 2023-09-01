class AccountModel {
  int? status;
  String? message;
  Account? account;

  AccountModel({this.status, this.message, this.account});

  AccountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
  }
}

class Account {
  String? name;
  String? lastName;

  Account({this.name, this.lastName});

  Account.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
  }
}
