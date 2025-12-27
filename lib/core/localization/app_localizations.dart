import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Alatareq App',
      'login': 'Login',
      'signup': 'Sign Up',
      'email': 'Email',
      'phone': 'Phone Number',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'name': 'Name',
      'otp_verification': 'OTP Verification',
      'enter_otp': 'Enter the code sent to your phone',
      'verify': 'Verify',
      'get_started': 'Get Started',
      'next': 'Next',
      'skip': 'Skip',
      'already_have_account': 'Already have an account?',
      'dont_have_account': 'Don\'t have an account?',
      'onboarding_1_title': 'Shop Online',
      'onboarding_1_desc': 'Browse and buy your favorite products easily.',
      'onboarding_2_title': 'Secure Payments',
      'onboarding_2_desc': 'Fast and secure money transfers.',
      'onboarding_3_title': 'Fast Delivery',
      'onboarding_3_desc': 'Get your orders delivered to your doorstep.',
      'description': 'Description',
      'total': 'Total',
      'add_to_cart': 'Add to Cart',
      'currency': 'EGP',
      'recommendations': 'Suggested for you',
      'added_to_cart': 'Added to cart',
      'hello': 'Hello',
      'explore_categories': 'Explore Categories',
      'featured_places': 'Featured Places',
      'popular_products': 'Popular Products',
      'search_hint': 'Search for products or places...',
      'welcome_back': 'Welcome Back!',
      'login_continue': 'Login to continue',
      'forgot_password': 'Forgot Password?',
      'invalid_login': 'Invalid email or password',
      'email_hint': 'Enter your email',
      'password_hint': 'Enter your password',
      'about_us': 'About Us',
      'services': 'Services',
      'offers': 'Offers & Promotions',
      'reviews': 'Reviews',
      'signup_desc': 'Create an account to start ordering',
      'password_mismatch': 'Passwords do not match',
      'required_field': 'This field is required',
    },
    'ar': {
      'title': 'تطبيق الطارق',
      'login': 'تسجيل الدخول',
      'signup': 'إنشاء حساب',
      'email': 'البريد الإلكتروني',
      'phone': 'رقم الهاتف',
      'password': 'كلمة المرور',
      'confirm_password': 'تأكيد كلمة المرور',
      'name': 'الاسم',
      'otp_verification': 'التحقق من الرمز',
      'enter_otp': 'أدخل الرمز المرسل إلى هاتفك',
      'verify': 'تحقق',
      'get_started': 'ابدأ الآن',
      'next': 'التالي',
      'skip': 'تخطي',
      'already_have_account': 'لديك حساب بالفعل؟',
      'dont_have_account': 'ليس لديك حساب؟',
      'onboarding_1_title': 'تسوّق أونلاين',
      'onboarding_1_desc': 'تصفح واشترِ منتجاتك المفضلة بسهولة.',
      'onboarding_2_title': 'دفع آمن',
      'onboarding_2_desc': 'تحويلات مالية سريعة وآمنة.',
      'onboarding_3_title': 'توصيل سريع',
      'onboarding_3_desc': 'استلم طلباتك عند باب منزلك.',
      'description': 'الوصف',
      'total': 'الإجمالي',
      'add_to_cart': 'أضف إلى السلة',
      'currency': 'ج.م',
      'recommendations': 'اقتراحات لك',
      'added_to_cart': 'تم الإضافة إلى السلة',
      'hello': 'أهلاً بك',
      'explore_categories': 'استكشف الأقسام',
      'featured_places': 'أماكن مميزة',
      'popular_products': 'منتجات شائعة',
      'search_hint': 'ابحث عن منتجات أو أماكن...',
      'welcome_back': 'مرحباً بعودتك!',
      'login_continue': 'سجل دخول للمتابعة',
      'forgot_password': 'نسيت كلمة المرور؟',
      'invalid_login': 'بريد إلكتروني أو كلمة مرور غير صحيحة',
      'email_hint': 'أدخل بريدك الإلكتروني',
      'password_hint': 'أدخل كلمة المرور',
      'about_us': 'عن المكان',
      'services': 'الخدمات',
      'offers': 'العروض والخصومات',
      'reviews': 'تقييم',
      'signup_desc': 'أنشئ حساباً للبدء في الطلب',
      'password_mismatch': 'كلمتا المرور غير متطابقتين',
      'required_field': 'هذا الحقل مطلوب',
    },
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
