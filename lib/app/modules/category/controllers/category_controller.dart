import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/category_model.dart';
import '../../../routes/app_pages.dart';

class CategoryController extends GetxController {
  List<CategoryModel> categories = [];

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() {
    categories = DummyHelper.categories;
  }

  void onCategoryTap(CategoryModel category) {
    Get.toNamed(Routes.PRODUCTS, arguments: category);
  }
}
