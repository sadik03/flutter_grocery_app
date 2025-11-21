import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../data/models/category_model.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: theme.textTheme.displaySmall),
        centerTitle: true,
        elevation: 0,
      ),
      body: controller.categories.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 80.sp,
                    color: theme.hintColor,
                  ),
                  16.verticalSpace,
                  Text(
                    'No Categories Available',
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.all(24.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.85,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return _buildCategoryCard(
                    context: context,
                    category: category,
                    index: index,
                  );
                },
              ),
            ),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required CategoryModel category,
    required int index,
  }) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () => controller.onCategoryTap(category),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  category.image,
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.contain,
                ),
              ),
            ).animate().scale(
              duration: 300.ms,
              delay: Duration(milliseconds: index * 50),
              curve: Curves.easeInSine,
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                category.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ).animate().fade().slideY(
                duration: 300.ms,
                delay: Duration(milliseconds: index * 50 + 100),
                begin: 1,
                curve: Curves.easeInSine,
              ),
            ),
          ],
        ),
      ),
    );
  }
}