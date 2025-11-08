import 'dart:async';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/categories/presentation/pages/presentation/widgets/category_card_item.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAdsWidget(
            adsImages: adsImages,
            currentIndex: _currentIndex,
            timer: _timer,
          ),
          SizedBox(
            height: 330.h,
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
                return Column(
                  children: [
                    CustomSectionBar(
                        sectionNname: 'Categories', function: () {}),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategoryWidget(
                              category: categories[index]);
                        },
                        itemCount: categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
