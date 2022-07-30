class OurCourtsImage {
    String ?img;

    OurCourtsImage({this.img});

    factory OurCourtsImage.fromJson(Map<String, dynamic> json) {
        return OurCourtsImage(
            img: json['img'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['img'] = this.img;
        return data;
    }
}