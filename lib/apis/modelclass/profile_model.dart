class ProfileModelClass {
  int? followersCount;
  int? followingCount;
  List<Level>? levelList;
  int? id;
  String? name;
  String? base_url;
  String? phone;
  String? email;
  String? profilePic;
  String? sport;
  String? bio;
  int? matches;

  ProfileModelClass(
      {this.followersCount,
      this.base_url,
      this.phone,
      this.email,
      this.followingCount,
      this.id,
      this.name,
      this.profilePic,
      this.sport,
      this.levelList,
      this.bio,this.matches});

  factory ProfileModelClass.fromJson(Map<String, dynamic> json) {
    return ProfileModelClass(
      followersCount: json['followersCount'],
      followingCount: json['followingCount'],
      id: json['id'],
      levelList: json['labList'] != null
          ? (json['labList'] as List).map((i) => Level.fromJson(i)).toList()
          : null,
      name: json['name'],
      phone: json['phone'],
      base_url: json['base_url'],
      email: json['email'],
      profilePic: json['profilePic'],
      sport: json['sport'],
      bio: json['bio'],
      matches: json['matches'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followersCount'] = this.followersCount;
    data['followingCount'] = this.followingCount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['sport'] = this.sport;
    data['base_url'] = this.base_url;
    data['bio'] = this.bio;
    data['matches'] = this.matches;

    return data;
  }
}

class Level {
  int? id;
  int? level;
  int? sport_id;

  Level({this.id, this.level, this.sport_id});

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      level: json['level'],
      sport_id: json['sport_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['sport_id'] = this.sport_id;
    return data;
  }
}
