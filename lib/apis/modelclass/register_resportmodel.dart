class AppointementmeasurmentModel1 {
  int? id;
  String? sport;


  AppointementmeasurmentModel1(
      {this.id,
        this.sport,
      });

  factory AppointementmeasurmentModel1.fromJson(Map<String, dynamic> json) {
    return AppointementmeasurmentModel1(
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

