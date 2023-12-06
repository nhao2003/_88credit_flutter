import 'package:equatable/equatable.dart';

class ContractTemplateEntity extends Equatable {
  final String? id;
  final String? templateName;
  final String? content;
  final bool? isActive;
  final DateTime? deletedAt;
  final DateTime? createdAt;

  const ContractTemplateEntity({
    this.id,
    this.templateName,
    this.content,
    this.isActive,
    this.deletedAt,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        templateName,
        content,
        isActive,
        deletedAt,
        createdAt,
      ];

  ContractTemplateEntity copyWith({
    String? id,
    String? templateName,
    String? content,
    bool? isActive,
    DateTime? deletedAt,
    DateTime? createdAt,
  }) {
    return ContractTemplateEntity(
      id: id ?? this.id,
      templateName: templateName ?? this.templateName,
      content: content ?? this.content,
      isActive: isActive ?? this.isActive,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
