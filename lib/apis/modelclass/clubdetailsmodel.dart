class ClubDetailsModel {
    String ?city;
    int? city_id;
    String? description;
    int? id;
    String? img;
    String? name;
    int? price;
    String? state;
    int? state_id;

    ClubDetailsModel({this.city, this.city_id, this.description, this.id, this.img, this.name, this.price, this.state, this.state_id});

    factory ClubDetailsModel.fromJson(Map<String, dynamic> json) {
        return ClubDetailsModel(
            city: json['city'],
            city_id: json['city_id'],
            description: json['description'],
            id: json['id'],
            img: json['img'],
            name: json['name'],
            price: json['price'],
            state: json['state'],
            state_id: json['state_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['city'] = this.city;
        data['city_id'] = this.city_id;
        data['description'] = this.description;
        data['id'] = this.id;
        data['img'] = this.img;
        data['name'] = this.name;
        data['price'] = this.price;
        data['state'] = this.state;
        data['state_id'] = this.state_id;
        return data;
    }
}