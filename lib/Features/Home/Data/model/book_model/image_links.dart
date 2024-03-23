import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String thumbnail;

  const ImageLinks({this.smallThumbnail,required this.thumbnail});

  factory ImageLinks.fromJson(
      Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String,
    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'smallThumbnail': smallThumbnail,
      'thumbnail': thumbnail,
    };
  }

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
