import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/categories/presentation/pages/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p12),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesInitial ||
              state is GetCategoriesLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetCategoriesFailureState) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.error),
                  Text(state.failure.toString()),
                  TextButton.icon(
                    onPressed: () {
                      context.read<CategoriesCubit>().getCAtegories();
                    },
                    label: Text('Reload!'),
                    icon: Icon(Icons.refresh),
                  )
                ],
              ),
            );
          }
          List<CategoryEntity> categories =
              context.watch<CategoriesCubit>().categories;
          return Row(
            children: [
              CategoriesList(
                categories: categories,
              ),
              SizedBox(
                width: AppSize.s16,
              ),
              SubCategoriesList()
            ],
          );
        },
      ),
    );
  }
}
