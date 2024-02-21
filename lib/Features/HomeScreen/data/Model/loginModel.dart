class LoginModel {
  LoginModel({
      this.id, 
      this.name, 
      this.type, 
      this.email, 
      this.emailVerifiedAt, 
      this.password, 
      this.image, 
      this.phone, 
      this.userSelral, 
      this.gender, 
      this.roleId, 
      this.rememberToken, 
      this.createdAt, 
      this.updatedAt,});

  LoginModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    image = json['image'];
    phone = json['phone'];
    userSelral = json['userSelral'];
    gender = json['gender'];
    roleId = json['role_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  num? type;
  String? email;
  dynamic emailVerifiedAt;
  String? password;
  String? image;
  String? phone;
  num? userSelral;
  num? gender;
  dynamic roleId;
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;
LoginModel copyWith({  num? id,
  String? name,
  num? type,
  String? email,
  dynamic emailVerifiedAt,
  String? password,
  String? image,
  String? phone,
  num? userSelral,
  num? gender,
  dynamic roleId,
  dynamic rememberToken,
  String? createdAt,
  String? updatedAt,
}) => LoginModel(  id: id ?? this.id,
  name: name ?? this.name,
  type: type ?? this.type,
  email: email ?? this.email,
  emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  password: password ?? this.password,
  image: image ?? this.image,
  phone: phone ?? this.phone,
  userSelral: userSelral ?? this.userSelral,
  gender: gender ?? this.gender,
  roleId: roleId ?? this.roleId,
  rememberToken: rememberToken ?? this.rememberToken,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['password'] = password;
    map['image'] = image;
    map['phone'] = phone;
    map['userSelral'] = userSelral;
    map['gender'] = gender;
    map['role_id'] = roleId;
    map['remember_token'] = rememberToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}