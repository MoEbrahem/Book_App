import 'package:equatable/equatable.dart';

class ReadingModes extends Equatable {
  final bool? text;
  final bool? image;

  const ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(
      Map<String, dynamic> json) {
    return ReadingModes(
      text: json['text'] as bool?,
      image: json['image'] as bool?,
    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'text': text,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [text, image];
}
