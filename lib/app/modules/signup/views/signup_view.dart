import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_form_field.dart';
import '../../../../utils/constants.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.verticalSpace,
                Center(
                  child: Image.asset(
                    Constants.logo,
                    width: 120.w,
                    height: 120.h,
                  ).animate().fade().scale(
                    duration: 300.ms,
                    curve: Curves.easeInSine,
                  ),
                ),
                30.verticalSpace,
                Text(
                  'Create Account',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fade().slideX(
                  duration: 300.ms,
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
                8.verticalSpace,
                Text(
                  'Sign up to get started',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.hintColor,
                  ),
                ).animate().fade().slideX(
                  duration: 300.ms,
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
                30.verticalSpace,
                CustomFormField(
                  controller: controller.nameController,
                  hint: 'Full Name',
                  textInputAction: TextInputAction.next,
                  validator: controller.validateName,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: theme.primaryColor,
                  ),
                ).animate().fade().slideX(
                  duration: 300.ms,
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
                20.verticalSpace,
                CustomFormField(
                  controller: controller.emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: controller.validateEmail,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: theme.primaryColor,
                  ),
                ).animate().fade().slideX(
                  duration: 300.ms,
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
                20.verticalSpace,
                Obx(
                  () => CustomFormField(
                    controller: controller.passwordController,
                    hint: 'Password',
                    obscureText: !controller.isPasswordVisible.value,
                    textInputAction: TextInputAction.next,
                    validator: controller.validatePassword,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: theme.primaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: theme.hintColor,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                ),
                20.verticalSpace,
                Obx(
                  () => CustomFormField(
                    controller: controller.confirmPasswordController,
                    hint: 'Confirm Password',
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    textInputAction: TextInputAction.done,
                    validator: controller.validateConfirmPassword,
                    onFieldSubmit: (_) => controller.signup(),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: theme.primaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: theme.hintColor,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                  ).animate().fade().slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                ),
                30.verticalSpace,
                Obx(
                  () => CustomButton(
                    text: 'Sign Up',
                    onPressed: controller.isLoading.value ? null : controller.signup,
                  ).animate().fade().slideY(
                    duration: 300.ms,
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: controller.goToLogin,
                      child: Text(
                        'Sign In',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ).animate().fade().slideY(
                  duration: 300.ms,
                  begin: 1,
                  curve: Curves.easeInSine,
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
