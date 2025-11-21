import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_grocery_app/app/components/custom_snackbar.dart';

class PaymentService extends GetxService {
  static const String _razorpayKey = 'rzp_test_RiJuI1fO4R1mQh'; // Replace with your Razorpay API key
  late Razorpay _razorpay;
  
  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear();
  }

  void openCheckout(double amount, {String? orderId, Map<String, dynamic>? options}) {
    try {
      var amountInPaise = (amount * 100).toInt(); // Convert to paise
      
      var defaultOptions = {
        'key': _razorpayKey,
        'amount': amountInPaise,
        'name': 'Grocery App',
        'description': 'Payment for your order',
        'prefill': {
          'contact': '1234567890', // You can get this from user profile
          'email': 'user@example.com', // You can get this from user profile
        },
        'external': {
          'wallets': ['paytm', 'phonepe', 'gpay']
        }
      };
      
      // Merge default options with provided options
      var finalOptions = {...defaultOptions, ...?options};

      debugPrint('PaymentService: calling Razorpay.open with options: $finalOptions');

      _razorpay.open(finalOptions);
    } catch (e, stackTrace) {
      debugPrint('Razorpay.open error: $e\n$stackTrace');
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Payment Error',
        message: e.toString(),
      );
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle successful payment
    CustomSnackBar.showCustomSnackBar(
      title: 'Success',
      message: 'Payment successful: ${response.paymentId}',
    );
    
    // You can navigate to order success page or perform other actions
    Get.back(result: true); // Close the payment screen
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Payment Failed',
      message: 'Error: ${response.code} - ${response.message}',
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet selection
    CustomSnackBar.showCustomSnackBar(
      title: 'External Wallet Selected',
      message: 'Selected wallet: ${response.walletName}',
    );
  }
}
