import 'package:equatable/equatable.dart';

class SearchInfo extends Equatable {
  final String? textSnippet;

  const SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(
      Map<String, dynamic> json) {
    return SearchInfo(
      textSnippet: json['textSnippet'] as String?,
    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'textSnippet': textSnippet,
    };
  }

  @override
  List<Object?> get props => [textSnippet];
}
