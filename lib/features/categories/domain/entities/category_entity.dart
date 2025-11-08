import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  String? id;
  String? name;
  String? image;
  CategoryEntity({this.id, this.image, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
