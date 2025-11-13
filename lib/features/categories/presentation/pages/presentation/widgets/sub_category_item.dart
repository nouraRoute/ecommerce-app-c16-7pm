import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final SubcategoryEntity subcategoryEntity;
  const SubCategoryItem({super.key, required this.subcategoryEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productsScreenRoute,
          arguments: subcategoryEntity.id),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subcategoryEntity.name ?? '',
            style: getRegularStyle(color: ColorManager.primary),
          )
        ],
      ),
    );
  }
}
