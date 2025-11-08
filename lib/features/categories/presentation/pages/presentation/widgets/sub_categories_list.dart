import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';
import 'package:ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/categories/presentation/pages/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is GetSubcategoriesLoadingState) {
          return Expanded(
              flex: 2,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        } else if (state is GetSubcategoriesFailureState) {
          return Expanded(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.error),
                  Text(state.failure.toString()),
                  TextButton.icon(
                    onPressed: () {
                      context.read<CategoriesCubit>().getSubcategories();
                    },
                    label: Text('Reload!'),
                    icon: Icon(Icons.refresh),
                  )
                ],
              ),
            ),
          );
        } else if (state is GetSubcategoriesSuccessState) {
          List<SubcategoryEntity> subcategories = state.subcategories;
          return Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: <Widget>[
                // category title
                SliverToBoxAdapter(
                  child: Text(
                    'Laptops & Electronics',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s14),
                  ),
                ),
                // the category card
                SliverToBoxAdapter(
                  child: CategoryCardItem(
                      "Laptops & Electronics",
                      ImageAssets.categoryCardImage,
                      goToCategoryProductsListScreen),
                ),
                // the grid view of the subcategories
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: subcategories.length,
                      (context, index) => SubCategoryItem(
                        subcategoryEntity: subcategories[index],
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: AppSize.s8,
                      crossAxisSpacing: AppSize.s8,
                    ))
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
