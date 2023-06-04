class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? password;
  final int? verified;
  final String? profielPicture;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.password,
    this.verified,
    this.profielPicture,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        // password: json['password'],
        verified: json['verified'],
        profielPicture: json['profiel_picture'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
      );

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? password,
    String? pin,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        balance: balance ?? this.balance,
        verified: verified,
        profielPicture: profielPicture,
        cardNumber: cardNumber,
        token: token,
      );
}
