class User {
  int? userId;
  String? userName;
  dynamic address;
  dynamic phone;

  User({this.userId, this.userName, this.address, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['user_id'] as int?,
        userName: json['user_name'] as String?,
        address: json['address'] as dynamic,
        phone: json['phone'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'user_name': userName,
        'address': address,
        'phone': phone,
      };
}
