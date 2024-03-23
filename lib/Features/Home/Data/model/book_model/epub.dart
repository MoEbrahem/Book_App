import 'package:equatable/equatable.dart';

class Epub extends Equatable {
  final bool? isAvailable;

  const Epub({this.isAvailable});

  factory Epub.fromJson(
      Map<String, dynamic> json) {
    return Epub(
      isAvailable: json['isAvailable'] as bool?,
    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'isAvailable': isAvailable,
    };
  }

  @override
  List<Object?> get props => [isAvailable];
}
