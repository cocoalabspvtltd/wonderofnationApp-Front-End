class CourtSlotsModelclass {
    String? image;
    List<Timeslot>? timeslots;

    CourtSlotsModelclass({this.image, this.timeslots});

    factory CourtSlotsModelclass.fromJson(Map<String, dynamic> json) {
        return CourtSlotsModelclass(
            image: json['image'],
            timeslots: json['timeslots'] != null ? (json['timeslots'] as List).map((i) => Timeslot.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['image'] = this.image;
        return data;
    }
}

class Timeslot {
    int? id;
    String? time;

    Timeslot({this.id, this.time});

    factory Timeslot.fromJson(Map<String, dynamic> json) {
        return Timeslot(
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