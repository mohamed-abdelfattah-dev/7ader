import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../../core/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  final Map<String, dynamic>? userData;
  const MainScreen({super.key, this.userData});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(userData: widget.userData),
      const PlaceholderScreen(title: 'المفضلة', icon: Icons.favorite_rounded),
      const PlaceholderScreen(
        title: 'السلة',
        icon: Icons.shopping_cart_rounded,
      ),
      const PlaceholderScreen(title: 'الإعدادات', icon: Icons.settings_rounded),
      ProfileScreen(userData: widget.userData),
    ];
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          IndexedStack(index: _selectedIndex, children: _screens),
          Positioned(left: 0, right: 0, bottom: 0, child: _buildBottomBar()),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_rounded, 'الرئيسية'),
          _buildNavItem(1, Icons.favorite_rounded, 'المفضلة'),
          _buildNavItem(2, Icons.shopping_cart_rounded, 'السلة'),
          _buildNavItem(3, Icons.settings_rounded, 'الاعدادات'),
          _buildNavItem(4, Icons.person_rounded, 'البروفايل'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.textSecondary.withOpacity(0.5),
              size: 26,
            ),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  const PlaceholderScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 80,
                color: AppColors.primary.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'هذه الصفحة قيد التطوير حالياً',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
