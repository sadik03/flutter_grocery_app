import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../components/custom_snackbar.dart';
import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';
import '../../../../services/payment_service.dart';

class CartController extends GetxController {

  // to hold the products in cart
  List<ProductModel> products = [];
  
  @override
  void onInit() {
    getCartProducts();
    super.onInit();
  }

  /// when the user press on purchase now button
  void onPurchaseNowPressed() async {
    // Calculate total amount
    double totalAmount = products.fold(0, (sum, product) => sum + (product.price * product.quantity));
    
    if (totalAmount <= 0) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error',
        message: 'Your cart is empty',
      );
      return;
    }

    try {
      // Get existing PaymentService instance or create one lazily
      final paymentService = Get.isRegistered<PaymentService>()
          ? Get.find<PaymentService>()
          : Get.put(PaymentService());

      // Debug print to verify button press
      debugPrint('CartController: opening Razorpay with amount = $totalAmount');

      // Open Razorpay payment gateway
      paymentService.openCheckout(
        totalAmount,
        options: {
          'name': 'Grocery App Order',
          'description': 'Payment for your grocery order',
          'prefill': {
            'contact': '1234567890', // Get from user profile
            'email': 'user@example.com', // Get from user profile
          },
        },
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error',
        message: 'Failed to process payment: $e',
      );
    }
  }

  /// get the cart products from the product list
  getCartProducts() {
    products = DummyHelper.products.where((p) => p.quantity > 0).toList();
    update();
  }

  /// clear products in cart and reset cart items count
  void clearCart() {
    DummyHelper.products.map((p) => p.quantity = 0).toList();
    Get.find<BaseController>().getCartItemsCount();
    getCartProducts(); // Refresh the cart list
  }
}