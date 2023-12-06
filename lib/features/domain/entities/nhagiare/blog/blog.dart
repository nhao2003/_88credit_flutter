import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final String id;
  final String title;
  final String shortDescription;
  final String author;
  final String content;
  final String thumbnail;
  final int numViews;
  final DateTime createdAt;
  final bool isFavorite;
  final bool isActive;

  const BlogEntity({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.content,
    required this.thumbnail,
    required this.numViews,
    required this.createdAt,
    required this.author,
    required this.isFavorite,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        shortDescription,
        content,
        thumbnail,
        numViews,
        createdAt,
        author,
        isFavorite,
        isActive,
      ];
}
