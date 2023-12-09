import 'package:cookbook/screen/view/ai.dart';
// import 'package:cookbook/screen/view/detail_masakan.dart';
import 'package:cookbook/screen/view/home.dart';
import 'package:cookbook/screen/view/video.dart';
import 'package:cookbook/screen/view/widget/setting.dart';
import 'package:cookbook/screen/viewmodel/view_model_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<NavBarViewModel>(context, listen: false);
    return Scaffold(
      body: Consumer<NavBarViewModel>(
        builder: (context, contactModel, child) {
          final List<Widget> screens = [
            const ChatWithAi(),
            const HomePage(),
            const VideoTutorial(),
            const setting()
          ];
          return screens[modelview.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<NavBarViewModel>(
        builder: (context, contactModel, child) {
          return GNav(
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 500),
            tabBackgroundColor: const Color(0xFF21ABA5),
            tabs: const [
              GButton(
                icon: Icons.emoji_objects,
                text: 'AI',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.movie,
                text: 'Video',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Setting',
              ),
            ],
            selectedIndex: contactModel.currentIndex,
            onTabChange: (index) {
              contactModel.changeIndex(index);
            },
          );
        },
      ),
    );
  }
}
