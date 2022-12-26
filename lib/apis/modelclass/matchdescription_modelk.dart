class MatchDescriptionModel {
  bool? success;
  int? statusCode;
  String? message;
  Match? match;

  MatchDescriptionModel(
      {this.success, this.statusCode, this.message, this.match});

  MatchDescriptionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    match = json['match'] != null ? new Match.fromJson(json['match']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.match != null) {
      data['match'] = this.match!.toJson();
    }
    return data;
  }
}

class Match {
  int? id;
  int? courtId;
  int? clubId;
  String? clubName;
  String? description;
  String? stateName;
  String? cityName;
  String? sport;
  String? time;
  int? type;
  String? date;
  List<PlayersupcomingPlayers>? players;
  int? playerCount;

  Match(
      {this.id,
        this.courtId,
        this.clubId,
        this.clubName,
        this.description,
        this.stateName,
        this.cityName,
        this.sport,
        this.time,
        this.type,
        this.date,
        this.players,
        this.playerCount});

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courtId = json['court_id'];
    clubId = json['club_id'];
    clubName = json['club_name'];
    description = json['description'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    sport = json['sport'];
    time = json['time'];
    type = json['type'];
    date = json['date'];
    if (json['players'] != null) {
      players = <PlayersupcomingPlayers>[];
      json['players'].forEach((v) {
        players!.add(new PlayersupcomingPlayers.fromJson(v));
      });
    }
    playerCount = json['player_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['court_id'] = this.courtId;
    data['club_id'] = this.clubId;
    data['club_name'] = this.clubName;
    data['description'] = this.description;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    data['sport'] = this.sport;
    data['time'] = this.time;
    data['type'] = this.type;
    data['date'] = this.date;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    data['player_count'] = this.playerCount;
    return data;
  }
}

class PlayersupcomingPlayers {
  int? playerId;
  int? userId;
  int? bookingId;
  String? name;
  String? profilePic;

  PlayersupcomingPlayers(
      {this.playerId, this.userId, this.bookingId, this.name, this.profilePic});

  PlayersupcomingPlayers.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    userId = json['user_id'];
    bookingId = json['booking_id'];
    name = json['name'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_id'] = this.playerId;
    data['user_id'] = this.userId;
    data['booking_id'] = this.bookingId;
    data['name'] = this.name;
    data['profilePic'] = this.profilePic;
    return data;
  }
}