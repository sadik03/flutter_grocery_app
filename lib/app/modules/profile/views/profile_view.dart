import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: theme.textTheme.displaySmall),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: theme.primaryColor,
                    child: Text(
                      controller.userInitials,
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ).animate().scale(
                    duration: 300.ms,
                    curve: Curves.easeInSine,
                  ),
                  16.verticalSpace,
                  Text(
                    controller.userName,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate().fade().slideY(
                    duration: 300.ms,
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
                  8.verticalSpace,
                  Text(
                    controller.userEmail,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.hintColor,
                    ),
                  ).animate().fade().slideY(
                    duration: 300.ms,
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  _buildProfileOption(
                    context: context,
                    icon: Icons.person_outline,
                    title: 'Edit Profile',
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature will be available soon',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  16.verticalSpace,
                  _buildProfileOption(
                    context: context,
                    icon: Icons.shopping_bag_outlined,
                    title: 'My Orders',
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature will be available soon',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  16.verticalSpace,
                  _buildProfileOption(
                    context: context,
                    icon: Icons.location_on_outlined,
                    title: 'Delivery Address',
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature will be available soon',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  16.verticalSpace,
                  _buildProfileOption(
                    context: context,
                    icon: Icons.payment_outlined,
                    title: 'Payment Methods',
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature will be available soon',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  16.verticalSpace,
                  _buildProfileOption(
                    context: context,
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature will be available soon',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  16.verticalSpace,
                  _buildProfileOption(
                    context: context,
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature will be available soon',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  16.verticalSpace,
                  _buildProfileOption(
                    context: context,
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature will be available soon',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  24.verticalSpace,
                  _buildProfileOption(
                    context: context,
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: controller.logout,
                    isLogout: true,
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    final theme = context.theme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isLogout
              ? Colors.red.withOpacity(0.1)
              : theme.cardColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isLogout
                ? Colors.red.withOpacity(0.3)
                : theme.dividerColor,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: isLogout
                    ? Colors.red.withOpacity(0.1)
                    : theme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: isLogout ? Colors.red : theme.primaryColor,
                size: 24.sp,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isLogout ? Colors.red : null,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: isLogout ? Colors.red : theme.hintColor,
            ),
          ],
        ),
      ),
    );
  }
}