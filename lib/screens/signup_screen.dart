import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:mqpal/screens/login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              controller: _emailController,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      )),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
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
                        SizedBox(height: 2.h),
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
                              controller: _confirmPasswordController,
                              obscureText: true,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
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
                  Container(
                    width: 55.w,
                    height: 14.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 13,
                      children: [
                        Text('Password Requirements',
                            style: Theme.of(context).textTheme.labelMedium),
                        Text(
                            ' - 8-12 Characters Long\n - 1 Special Character (!@#%^&*)\n - 1 Numerical Character\n - Multiple Capital Letters.\n',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _handleSignUp,
                        child: Text(
                          'Already a user? Sign in here.',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  GestureDetector(
                    onTap: _handleSignUp,
                    child: Container(
                      width: 24.w,
                      height: 6.h,
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.sp),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
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
          SizedBox(height: 2.h),
        ],
      ),
    ));
  }
}
