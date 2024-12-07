import 'package:flutter/material.dart';
import 'package:kawika_project/common/bottom_bar_vm.dart';
import 'package:kawika_project/view/pages/home__page.dart';
import 'package:kawika_project/view/pages/profile_page.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  final List<Widget> pages = [HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomBarVm>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomProvider.currentIndex,
          onTap: (index) {
            bottomProvider.navigate(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      body: pages[bottomProvider.currentIndex],
    );
  }
}
