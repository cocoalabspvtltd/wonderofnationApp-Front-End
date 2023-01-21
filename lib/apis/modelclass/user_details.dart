
class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? phone;
  String? profilePic;
  int? role;
  String? createdAt;
  String? updatedAt;
  String? authType;
  String? bio;
  Null? isVerified;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.profilePic,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.authType,
        this.bio,
        this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    profilePic = json['profilePic'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authType = json['auth_type'];
    bio = json['bio'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['auth_type'] = this.authType;
    data['bio'] = this.bio;
    data['is_verified'] = this.isVerified;
    return data;
  }
}