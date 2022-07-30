class ReservationCourtModel {
    List<Court>? courts;
    String ?image;
    List<TimeSlot>? timeSlots;

    ReservationCourtModel({this.courts, this.image, this.timeSlots});

    factory ReservationCourtModel.fromJson(Map<String, dynamic> json) {
        return ReservationCourtModel(
            courts: json['courts'] != null ? (json['courts'] as List).map((i) => Court.fromJson(i)).toList() : null,
            image: json['image'],
            timeSlots: json['timeSlots'] != null ? (json['timeSlots'] as List).map((i) => TimeSlot.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['image'] = this.image;

        return data;
    }
}

class TimeSlot {
    int? id;
    String? time;

    TimeSlot({this.id, this.time});

    factory TimeSlot.fromJson(Map<String, dynamic> json) {
        return TimeSlot(
            id: json['id'],
            time: json['time'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['time'] = this.time;
        return data;
    }
}

class Court {
    int? id;
    int? sport_id;

    Court({this.id, this.sport_id});

    factory Court.fromJson(Map<String, dynamic> json) {
        return Court(
            id: json['id'],
            sport_id: json['sport_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['sport_id'] = this.sport_id;
        return data;
    }
}