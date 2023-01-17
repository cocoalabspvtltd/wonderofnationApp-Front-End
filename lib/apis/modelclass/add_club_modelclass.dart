class AddClubModelclass {
    String? city;
    int? id;
    String? img;
    String? name;
    String? state;
    AddClubModelclass({this.city, this.id, this.img, this.name, this.state});

    factory AddClubModelclass.fromJson(Map<String, dynamic> json) {
        return AddClubModelclass(
            city: json['city'],
            id: json['id'],
            img: json['img'],
            name: json['name'],
            state: json['state'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['city'] = this.city;
        data['id'] = this.id;
        data['img'] = this.img;
        data['name'] = this.name;
        data['state'] = this.state;
        return data;
    }
}