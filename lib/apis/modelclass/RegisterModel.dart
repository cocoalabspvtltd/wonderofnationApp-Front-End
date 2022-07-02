class RegisterModel {
    List<Sport> ?sports;
    User? user;

    RegisterModel({this.sports, this.user});

    factory RegisterModel.fromJson(Map<String, dynamic> json) {
        return RegisterModel(
            sports: json['sports'],
            user: json['user'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        return data;
    }
}

class Sport {
    int? id;
    String? sport;

    Sport({this.id, this.sport});

    factory Sport.fromJson(Map<String, dynamic> json) {
        return Sport(
            id: json['id'],
            sport: json['sport'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['sport'] = this.sport;
        return data;
    }
}

class User {
    String? created_at;
    String? email;
    int? id;
    String? name;
    String? phone;
    int? role;
    String? updated_at;

    User({this.created_at, this.email, this.id, this.name, this.phone, this.role, this.updated_at});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            created_at: json['created_at'],
            email: json['email'],
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            role: json['role'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['role'] = this.role;
        data['updated_at'] = this.updated_at;
        return data;
    }
}