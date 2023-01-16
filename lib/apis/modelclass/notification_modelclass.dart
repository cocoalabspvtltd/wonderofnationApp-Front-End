class NotificationModelClass {
    List<Notifications>? notifications;
    List<Null>? unread;

    NotificationModelClass({this.notifications, this.unread});

    NotificationModelClass.fromJson(Map<String, dynamic> json) {
        if (json['notifications'] != null) {
            notifications =  <Notifications>[];
            json['notifications'].forEach((v) {
                notifications!.add(new Notifications.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.notifications != null) {
            data['notifications'] =
                this.notifications!.map((v) => v.toJson()).toList();
        }

        return data;
    }
}

class Notifications {
    String? id;
    Data? data;
    String? time;

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
    int? statusId;
    int? matchId;
    String? matchDate;
    String? clubName;
    String? winStatus;
    String? date;
    String? status;


    Data(
        {this.name,
            this.type,
            this.statusId,
            this.matchId,
            this.matchDate,
            this.clubName,
            this.winStatus,
            this.date,
        this.status});

    Data.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        type = json['type'];
        statusId = json['status_id'];
        matchId = json['match_id'];
        matchDate = json['match_date'];
        clubName = json['club_name'];
        winStatus = json['win_status'];
        date = json['date'];
        status = json['status'];

    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['type'] = this.type;
        data['status_id'] = this.statusId;
        data['match_id'] = this.matchId;
        data['match_date'] = this.matchDate;
        data['club_name'] = this.clubName;
        data['win_status'] = this.winStatus;
        data['date'] = this.date;
        data['status'] = this.status;
        return data;
    }
}