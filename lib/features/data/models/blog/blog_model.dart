import '../../../domain/entities/nhagiare/blog/blog.dart';

class BlogModel extends BlogEntity {
  const BlogModel({
    required super.id,
    required super.title,
    required super.shortDescription,
    required super.content,
    required super.thumbnail,
    required super.createdAt,
    required super.author,
    required super.isActive,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      shortDescription: json['short_description'],
      content: json['content'],
      thumbnail: json['thumbnail'],
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
      author: json['author'],
      isActive: json['is_active'],
    );
  }
}
