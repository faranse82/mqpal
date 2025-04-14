import 'package:flutter/material.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:mqpal/screens/signup_screen.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _handleSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  void _handleForgotPassword() {
    // Implement forgot password functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            // Main login card
            Center(
              child: Container(
                width: 75.w,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 3.h),
                    Text(
                      'MQPal',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 3.h),

                    // Username and Password fields
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Username field
                          Container(
                            width: 70.w,
                            height: 6.h,
                            decoration: ShapeDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.sp),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: TextField(
                                controller: _usernameController,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Username',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),

                          // Password field
                          Container(
                            width: 70.w,
                            height: 6.h,
                            decoration: ShapeDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.sp),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),

                    // Sign up and Forgot Password text
                    Column(
                      children: [
                        GestureDetector(
                          onTap: _handleSignUp,
                          child: Text(
                            'Not a user? Sign up here',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        GestureDetector(
                          onTap: _handleForgotPassword,
                          child: Text(
                            'Forgot Password',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),

                    // Sign In Button
                    GestureDetector(
                      onTap: _handleSignIn,
                      child: Container(
                        width: 28.w,
                        height: 8.h,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.sp),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),

                    // Bottom colored line
                    Container(
                      width: 85.w,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(4.sp),
                            bottomLeft: Radius.circular(4.sp),
                          ),
                          side: BorderSide(
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
