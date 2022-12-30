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
    String ?id;
    Data ?data;
    String ?time;

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
    String ?name;
    String? date;
    String? type;

    Data({this.name, this.date, this.type});

    Data.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        date = json['date'];
        type = json['type'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['date'] = this.date;
        data['type'] = this.type;
        return data;
    }
}