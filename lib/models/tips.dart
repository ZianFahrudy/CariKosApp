part of 'models.dart';

class Tips extends Equatable {
  final int id;
  final String title;
  final String image;
  final String updateAt;

  Tips({this.id, this.image, this.title, this.updateAt});

  @override
  List<Object> get props => [id, title, image, updateAt];
}
