

class Sport {
    int? id;
    String? sport;

    Sport({this.id, this.sport});

    factory Sport.fromJson(Map<String, dynamic> json) {
        return Sport(
            id: json['id'],
            sport: json['sport'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['sport'] = this.sport;
        return data;
    }
}