class ResultModelClass {
  bool? success;
  int? statusCode;
  String? message;
  int? total;
  String? page;
  int? lastPage;
  List<Results>? results;

  ResultModelClass(
      {this.success,
        this.statusCode,
        this.message,
        this.total,
        this.page,
        this.lastPage,
        this.results});

  ResultModelClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    total = json['total'];
    page = json['page'];
    lastPage = json['last_page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['total'] = this.total;
    data['page'] = this.page;
    data['last_page'] = this.lastPage;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? bookingId;
  String? clubName;
  String? stateName;
  String? cityName;
  String? sport;
  String? time;
  int? type;
  String? date;
  int? winStatus;
  String? status;

  Results(
      {required this.id,
        this.bookingId,
        this.clubName,
        this.stateName,
        this.cityName,
        this.sport,
        this.time,
        this.type,
        this.date,
        this.winStatus,
        this.status});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    clubName = json['club_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    sport = json['sport'];
    time = json['time'];
    type = json['type'];
    date = json['date'];
    winStatus = json['win_status'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['club_name'] = this.clubName;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    data['sport'] = this.sport;
    data['time'] = this.time;
    data['type'] = this.type;
    data['date'] = this.date;
    data['win_status'] = this.winStatus;
    data['status'] = this.status;
    return data;
  }
}