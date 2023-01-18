class UserSuggestionModel {
    bool? success;
    int ?statusCode;
    int? lastPage;
    String ?page;
    String? perPage;
    List<Users>? users;

    UserSuggestionModel(
        { this.success,
             this.statusCode,
             this.lastPage,
             this.page,
             this.perPage,
             this.users});

    UserSuggestionModel.fromJson(Map<String, dynamic> json) {
        success = json['success'];
        statusCode = json['status_code'];
        lastPage = json['last_page'];
        page = json['page'];
        perPage = json['per_page'];
        if (json['users'] != null) {
            users = <Users>[];
            json['users'].forEach((v) {
                users!.add(new Users.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['success'] = this.success;
        data['status_code'] = this.statusCode;
        data['last_page'] = this.lastPage;
        data['page'] = this.page;
        data['per_page'] = this.perPage;
        if (this.users != null) {
            data['users'] = this.users!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Users {
    int? id;
    String? name;
    String ?profilePic;
    int? followStatus;

    Users({required this.id, required this.name, this.profilePic, required this.followStatus});

    Users.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        profilePic = json['profilePic'];
        followStatus = json['follow_status'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        data['profilePic'] = this.profilePic;
        data['follow_status'] = this.followStatus;
        return data;
    }
}