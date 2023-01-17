class AddPlayersModel {
  List<Players>? players;
  int? total;
  String? page;
  int? lastPage;

  AddPlayersModel({this.players, this.total, this.page, this.lastPage});

  AddPlayersModel.fromJson(Map<String, dynamic> json) {
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['last_page'] = this.lastPage;
    return data;
  }
}

class Players {
  int? id;
  String? name;
  String? profilePic;

  Players({this.id, this.name, this.profilePic});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profilePic'] = this.profilePic;
    return data;
  }
}