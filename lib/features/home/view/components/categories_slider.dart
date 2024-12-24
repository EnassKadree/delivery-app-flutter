import 'package:delivery_app/core/Extensions/widget.extenstion.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:delivery_app/features/home/service/slider/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_container.dart';


class CategoriesSlider extends StatelessWidget 
{
  const CategoriesSlider({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
      viewportFraction: .8,
    );

    return BlocProvider(
      create: (context) {
        final cubit = CategoriesSliderCubit();
        cubit.startAutoScroll(context, controller, categories.length);
        return cubit;
      },
      child: BlocBuilder<CategoriesSliderCubit, int>(
        builder: (context, currentPage) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 5.5,
            child: PageView.builder(
              controller: controller,
              itemCount: categories.length,
              onPageChanged: (int page) {
                context.read<CategoriesSliderCubit>().emit(page); 
              },
              itemBuilder: (context, index) {
                double scale = currentPage == index ? 1.0 : 0.9;
                return AnimatedScale
                (
                  scale: scale,
                  duration: const Duration(milliseconds: 500),
                  child: CategoryContainer(category: categories[index]).staggerListVertical(index),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
