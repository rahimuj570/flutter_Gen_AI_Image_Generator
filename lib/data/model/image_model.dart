// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageModel {
  final String url;
  final String prompt;
  final DateTime createdAt;

  ImageModel({
    required this.url,
    required this.prompt,
    required this.createdAt,
  });

  ImageModel copyWith({String? url, String? prompt, DateTime? createdAt}) {
    return ImageModel(
      url: url ?? this.url,
      prompt: prompt ?? this.prompt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'prompt': prompt,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      url: map['url'] as String,
      prompt: map['prompt'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ImageModel(url: $url, prompt: $prompt, createdAt: $createdAt)';

  @override
  bool operator ==(covariant ImageModel other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.prompt == prompt &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => url.hashCode ^ prompt.hashCode ^ createdAt.hashCode;
}
