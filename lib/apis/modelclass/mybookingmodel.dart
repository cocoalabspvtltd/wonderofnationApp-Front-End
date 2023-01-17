class AddPlayersModel {
  bool? success;
  int? statusCode;
  int ?total;
  String? page;
  int? lastPage;
  List<Matches>? matches;

  AddPlayersModel(
      {this.success,
        this.statusCode,
        this.total,
        this.page,
        this.lastPage,
        this.matches});

  AddPlayersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    total = json['total'];
    page = json['page'];
    lastPage = json['last_page'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['total'] = this.total;
    data['page'] = this.page;
    data['last_page'] = this.lastPage;
    data['matches'] = this.matches;
    return data;
  }
}

class Matches {
  int? id;
  int? courtId;
  int? clubId;
  String? clubName;
  String? stateName;
  String? cityName;
  String? sport;
  String? time;
  int? type;
  String? date;
  int?win_status;
  String?status;

  Matches(
      {this.id,
        this.courtId,
        this.clubId,
        this.clubName,
        this.stateName,
        this.cityName,
        this.sport,
        this.time,
        this.type,
        this.date,
      this.win_status,this.status});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courtId = json['court_id'];
    clubId = json['club_id'];
    clubName = json['club_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    sport = json['sport'];
    time = json['time'];
    type = json['type'];
    date = json['date'];
    win_status = json['win_status'];
    status=json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['court_id'] = this.courtId;
    data['club_id'] = this.clubId;
    data['club_name'] = this.clubName;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    data['sport'] = this.sport;
    data['time'] = this.time;
    data['type'] = this.type;
    data['date'] = this.date;
    data['win_status']= this.win_status;
    data['status']=this.status;
    return data;

  }
}