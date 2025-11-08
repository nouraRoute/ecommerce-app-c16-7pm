import 'package:equatable/equatable.dart';

class SubcategoryEntity extends Equatable {
  final String? id;
  final String? name;

  const SubcategoryEntity({required this.id, required this.name});
  @override
  List<Object?> get props => [id];
}
