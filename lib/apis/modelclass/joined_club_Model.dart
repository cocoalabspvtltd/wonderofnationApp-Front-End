class JoinedClubModel {
    String? email;
    int? id;
    int? laravel_through_key;
    String? name;
    String ?img;

    JoinedClubModel({this.email, this.id, this.laravel_through_key, this.name,this.img});

    factory JoinedClubModel.fromJson(Map<String, dynamic> json) {
        return JoinedClubModel(
            email: json['email'],
            id: json['id'],
            laravel_through_key: json['laravel_through_key'],
            name: json['name'],
            img: json['img']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['laravel_through_key'] = this.laravel_through_key;
        data['name'] = this.name;
        data['img'] = this.img;
        return data;
    }
}