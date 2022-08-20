class AppointementmeasurmentModel {
    int? id;
    String? sport;


    AppointementmeasurmentModel(
        {this.id,
            this.sport,
            });

    factory AppointementmeasurmentModel.fromJson(Map<String, dynamic> json) {
        return AppointementmeasurmentModel(
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

