import 'package:get/get.dart';
import '../../services/payment_service.dart';
import '../data/services/auth_service.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Initialize AuthService
    await Get.putAsync(() => AuthService().init());
    
    // Initialize PaymentService
    Get.put(PaymentService(), permanent: true);
    
    return;
  }
}
