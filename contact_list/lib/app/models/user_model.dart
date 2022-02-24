class UserModel {
  String? fullName;
  int? age;
  String? cellPhone;

  UserModel({this.fullName, this.age, this.cellPhone});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    age = json['age'];
    cellPhone = json['cellPhone'];
  }

  UserModel copyWith({
    String? fullName,
    int? age,
    String? cellPhone,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      cellPhone: cellPhone ?? this.cellPhone,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['age'] = age;
    data['cellPhone'] = cellPhone;
    return data;
  }
}
