class FollowModelClass {
  bool? success;
  int? statusCode;
  String? message;
  int? total;
  String? page;
  int? lastPage;
  List<Following>? following;

  FollowModelClass(
      {this.success,
        this.statusCode,
        this.message,
        this.total,
        this.page,
        this.lastPage,
        this.following});

  FollowModelClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    total = json['total'];
    page = json['page'];
    lastPage = json['last_page'];
    if (json['following'] != null) {
      following =  <Following>[];
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['total'] = this.total;
    data['page'] = this.page;
    data['last_page'] = this.lastPage;
    if (this.following != null) {
      data['following'] = this.following!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Following {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? phone;
  Null? profilePic;
  int? role;
  String? createdAt;
  String? updatedAt;
  String? authType;
  String? bio;
  Null? isVerified;
  int? laravelThroughKey;

  Following(
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
        this.isVerified,
        this.laravelThroughKey});

  Following.fromJson(Map<String, dynamic> json) {
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
    laravelThroughKey = json['laravel_through_key'];
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
    data['laravel_through_key'] = this.laravelThroughKey;
    return data;
  }
}