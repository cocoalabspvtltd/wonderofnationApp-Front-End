

class ClubModel {
    String? created_at;
    String? email;
    int? id;
    String? name;
    String? phone;
    String? updated_at;
    int? user_id;
    String?img;
    String?state;
    String?city;
    String?description;

    ClubModel({this.created_at,this.img,this.city,this.description,this.state, required email , this.id, this.name, this.phone, this.updated_at, this.user_id});

    factory ClubModel.fromJson(Map<String, dynamic> json) {
        return ClubModel(
            created_at: json['created_at'],
            email: json['email'],
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            updated_at: json['updated_at'],
            user_id: json['user_id'],
            img:json['img'],
            state: json['state'],
            city: json['city'],
            description:json['description']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['img'] = this.img;
        data['state'] = this.state;
        data['city'] = this.city;
        data['description'] = this.description;
        return data;
    }
}