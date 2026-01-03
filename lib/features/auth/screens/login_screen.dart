import 'package:flutter/material.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/database/database_helper.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/screens/main_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final db = DatabaseHelper();
      var user = await db.loginUser(
        _emailController.text,
        _passwordController.text,
      );

      if (!mounted) return;
      setState(() => _isLoading = false);

      if (user != null) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, second) =>
                MainScreen(userData: user),
            transitionsBuilder: (context, animation, second, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "بريد إلكتروني أو كلمة مرور غير صحيحة",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context);
    String getStr(String key) => loc?.get(key) ?? key;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          // Background Decorative Gradients
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.15),
                    AppColors.primary.withOpacity(0.01),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.secondary.withOpacity(0.1),
                    AppColors.secondary.withOpacity(0.01),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 40,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    // Branding Icon with soft shadow
                    Center(
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.15),
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.shopping_bag_rounded,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      getStr('welcome_back') == 'welcome_back'
                          ? 'مرحباً بعودتك'
                          : getStr('welcome_back'),
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      getStr('login_continue') == 'login_continue'
                          ? 'سجل دخولك للمتابعة معنا'
                          : getStr('login_continue'),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),

                    _buildTextField(
                      controller: _emailController,
                      label: getStr('email') == 'email'
                          ? 'البريد الإلكتروني'
                          : getStr('email'),
                      icon: Icons.email_rounded,
                      hint: 'example@mail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(
                      controller: _passwordController,
                      label: getStr('password') == 'password'
                          ? 'كلمة المرور'
                          : getStr('password'),
                      icon: Icons.lock_rounded,
                      hint: '••••••••',
                      isPassword: true,
                    ),

                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          getStr('forgot_password') == 'forgot_password'
                              ? 'نسيت كلمة المرور؟'
                              : getStr('forgot_password'),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : Text(
                              getStr('login') == 'login'
                                  ? 'تسجيل الدخول'
                                  : getStr('login'),
                            ),
                    ),
                    const SizedBox(height: 32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getStr('dont_have_account') == 'dont_have_account'
                              ? 'ليس لديك حساب؟'
                              : getStr('dont_have_account'),
                          style: TextStyle(
                            color: AppColors.textSecondary.withOpacity(0.8),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            getStr('signup') == 'signup'
                                ? 'إنشاء حساب جديد'
                                : getStr('signup'),
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String hint,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primary),
            filled: true,
            fillColor: AppColors.scaffoldBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(18),
          ),
          validator: (value) =>
              (value == null || value.isEmpty) ? 'هذا الحقل مطلوب' : null,
        ),
      ],
    );
  }
}
