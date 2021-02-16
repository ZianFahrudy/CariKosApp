part of 'models.dart';

class City extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final bool isPopular;

  City({this.id, this.title, this.imageUrl, this.isPopular = false});
  @override
  List<Object> get props => [id, title, imageUrl];
}
