class NotificationModelClass {
    List<Notifications>? notifications;
    List<Null>? unread;
    int? uCount;
    int? tCount;

    NotificationModelClass(
        {this.notifications, this.unread, this.uCount, this.tCount});

    NotificationModelClass.fromJson(Map<String, dynamic> json) {
        if (json['notifications'] != null) {
            notifications =  <Notifications>[];
            json['notifications'].forEach((v) {
                notifications!.add(new Notifications.fromJson(v));
            });
        }
        uCount = json['uCount'];
        tCount = json['tCount'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.notifications != null) {
            data['notifications'] =
                this.notifications!.map((v) => v.toJson()).toList();
        }
        data['uCount'] = this.uCount;
        data['tCount'] = this.tCount;
        return data;
    }
}

class Notifications {
    String? id;
    Data? data;
    String?  time;

    Notifications({this.id, this.data, this.time});

    Notifications.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        data = json['data'] != null ? new Data.fromJson(json['data']) : null;
        time = json['time'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        if (this.data != null) {
            data['data'] = this.data!.toJson();
        }
        data['time'] = this.time;
        return data;
    }
}

class Data {
    String? name;
    String? type;
    String? status;
    int? playerId;
    int? matchId;
    int? statusId;
    String? matchDate;
    String? clubName;
    String? winStatus;

    Data(
        {this.name,
            this.type,
            this.status,
            this.playerId,
            this.matchId,
            this.statusId,
            this.matchDate,
            this.clubName,
            this.winStatus});

    Data.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        type = json['type'];
        status = json['status'];
        playerId = json['player_id'];
        matchId = json['match_id'];
        statusId = json['status_id'];
        matchDate = json['match_date'];
        clubName = json['club_name'];
        winStatus = json['win_status'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['type'] = this.type;
        data['status'] = this.status;
        data['player_id'] = this.playerId;
        data['match_id'] = this.matchId;
        data['status_id'] = this.statusId;
        data['match_date'] = this.matchDate;
        data['club_name'] = this.clubName;
        data['win_status'] = this.winStatus;
        return data;
    }
}