import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;
  const CustomBottomNavigationBar(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: HomeIcon(isSelected: false),
      activeIcon: HomeIcon(isSelected: true),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: DiscoverIcon(isSelected: false),
      activeIcon: DiscoverIcon(isSelected: true),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: BookmarkIcon(isSelected: false),
      activeIcon: BookmarkIcon(isSelected: true),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: AiIcon(isSelected: false),
      activeIcon: AiIcon(isSelected: false),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            unselectedFontSize: 0.0,
            selectedFontSize: 0.0,
            currentIndex: widget.selectedIndex,
            onTap: widget.onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: _bottomNavItems.map((item) {
              return BottomNavigationBarItem(
                icon: item.icon,
                activeIcon: item.activeIcon,
                label: item.label,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// Icon Widgets
class HomeIcon extends StatelessWidget {
  final bool isSelected;
  const HomeIcon({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isSelected ? 'assets/icons/home-filled.svg' : 'assets/icons/home.svg',
      color: isSelected ? ColorConstant.primary : Colors.grey[600],
    );
  }
}

class DiscoverIcon extends StatelessWidget {
  final bool isSelected;
  const DiscoverIcon({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isSelected
          ? 'assets/icons/discover-filled.svg'
          : 'assets/icons/discover.svg',
      color: isSelected ? ColorConstant.primary : Colors.grey[600],
      height: 28,
      width: 26,
    );
  }
}

class BookmarkIcon extends StatelessWidget {
  final bool isSelected;
  const BookmarkIcon({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isSelected
          ? 'assets/icons/bookmark-filled.svg'
          : 'assets/icons/bookmark.svg',
      color: isSelected ? ColorConstant.primary : Colors.grey[600],
    );
  }
}

class AiIcon extends StatelessWidget {
  final bool isSelected;
  const AiIcon({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/ai-icon.svg',
      color: isSelected ? ColorConstant.primary : Colors.grey[600],
      height: 24,
      width: 22,
    );
  }
}
