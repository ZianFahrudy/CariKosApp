part of 'widgets.dart';

class PhotosCard extends StatelessWidget {
  final dynamic icon;
  final int index;

  PhotosCard({this.icon, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(image: NetworkImage(icon), fit: BoxFit.cover)),
    );
  }
}
