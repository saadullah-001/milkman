import 'package:flutter/material.dart';
import 'package:milkman/utils/routes/route_names.dart';
import 'package:milkman/utils/theme/colors.dart';
import 'package:milkman/utils/theme/responsive_text.dart';
import 'package:milkman/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscure = true;

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ KEEP SAME AS YOU WROTE
            Container(
              height: size.height * 0.25,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text('Welcome Back!', style: ResponsiveText.title(context)),
            SizedBox(height: size.height * 0.005),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: size.width * 0.1,
              ),
              child: Text(
                'Login to access fresh milk and pet care services.',
                textAlign: TextAlign.center,
                style: ResponsiveText.body(context).copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),

            // ✅ REMAINING UI (ADDED)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email or Username',
                    style: ResponsiveText.body(context),
                  ),
                  SizedBox(height: size.height * 0.02),
                  // Email Field
                  Input(
                    controller: _emailCtrl,
                    hint: 'Enter your email',
                    icon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                    islogin: true,
                  ),

                  SizedBox(height: size.height * 0.025),

                  // Password Label
                  Text('Password', style: ResponsiveText.body(context)),
                  SizedBox(height: size.height * 0.02),

                  // Password Field
                  Input(
                    controller: _passCtrl,
                    hint: 'Enter your password',
                    icon: Icons.lock,
                    obscureText: _obscure,
                    suffix: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    islogin: true,
                  ),

                  SizedBox(height: size.height * 0.015),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.forgotPasswordView,
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: ResponsiveText.caption(context).copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.02),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Log In',
                        style: ResponsiveText.body(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  // Divider - Or continue with
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Or continue with',
                          style: ResponsiveText.caption(context).copyWith(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),

                  SizedBox(height: size.height * 0.02),

                  // Social Buttons
                  Row(
                    children: [
                      Expanded(
                        child: SocialButton(
                          label: 'Google',
                          icon: Icons
                              .g_mobiledata, // replace with Image.asset if you have logo
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SocialButton(
                          label: 'Apple',
                          icon: Icons.apple,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.03),

                  // Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: ResponsiveText.body(
                          context,
                        ).copyWith(color: Colors.grey.shade600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.signupView);
                        },
                        child: Text(
                          'Sign Up',
                          style: ResponsiveText.body(context).copyWith(
                            color: const Color(0xFF2B9DEE),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
