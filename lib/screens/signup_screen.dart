import 'package:flutter/material.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
      MaterialPageRoute(builder: (context) => const HomeScreen()),
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
            width: 85.w,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.black),
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
                  style: Theme.of(context).textTheme.displayLarge,
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
                                style: Theme,
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
