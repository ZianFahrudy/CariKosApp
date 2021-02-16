part of 'models.dart';

class Space extends Equatable {
  final int id;
  final String image;
  final String title;
  final int price;
  final String city;
  final String country;
  final int rating;
  final String address;
  final String phone;
  final String mapUrl;
  final List photo;
  final int numberOfKitchen;
  final int numberOfbedroom;
  final int numberOfCupboard;
  Space(
      {this.id,
      this.image,
      this.city,
      this.country,
      this.price,
      this.rating,
      this.title,
      this.address,
      this.mapUrl,
      this.numberOfCupboard,
      this.numberOfKitchen,
      this.numberOfbedroom,
      this.phone,
      this.photo});

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
        id: json['id'],
        title: json['name'],
        city: json['city'],
        country: json['country'],
        image: json['image_url'],
        rating: json['rating'],
        address: json['address'],
        mapUrl: json['map_url'],
        phone: json['phone'],
        photo: json['photos'],
        price: json['price'],
        numberOfKitchen: json['number_of_kitchens'],
        numberOfCupboard: json['number_of_cupboards'],
        numberOfbedroom: json['number_of_bedrooms']);
  }
  @override
  List<Object> get props => [
        id,
        image,
        title,
        price,
        city,
        country,
        rating,
        mapUrl,
        address,
        city,
        numberOfKitchen,
        numberOfCupboard,
        numberOfbedroom,
        phone,
        photo
      ];
}
