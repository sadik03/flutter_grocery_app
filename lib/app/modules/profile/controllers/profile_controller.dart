import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  String get userName => _authService.currentUser?.displayName ?? 'User';
  String get userEmail => _authService.currentUser?.email ?? 'email@example.com';
  String get userInitials {
    if (_authService.currentUser?.displayName != null) {
      final names = _authService.currentUser!.displayName!.split(' ');
      if (names.length >= 2) {
        return '${names[0][0]}${names[1][0]}'.toUpperCase();
      }
      return names[0][0].toUpperCase();
    }
    return 'U';
  }

  Future<void> logout() async {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await _authService.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
