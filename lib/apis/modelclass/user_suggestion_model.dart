

class UserSuggestionModel {
    int? id;
    String? name;
    String? profilePic;

    UserSuggestionModel({this.id, this.name, this.profilePic});

    factory UserSuggestionModel.fromJson(Map<String, dynamic> json) {
        return UserSuggestionModel(
            id: json['id'],
            name: json['name'],
            profilePic: json['profilePic'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        data['profilePic'] = this.profilePic;
        return data;
    }
}