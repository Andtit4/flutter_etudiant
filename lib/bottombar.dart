import 'package:cine/home.dart';
import 'package:cine/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int idadmin;
  const BottomBar({super.key, required this.idadmin});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  PageController _controller = PageController();
  late int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (int value) {
          setState(() {
            currentPage = value;
          });
        },
        children: [HomePage(idadmin: widget.idadmin), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int value) {
            // currentPage = value;
            print("__CURRENT_PAGE__$value");
            setState(() {
              currentPage = value;
            });
            _controller.animateToPage(currentPage,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);

            print("__CURRENT_PAGE__AFTER__$currentPage");
          },
          currentIndex: currentPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: 'Paramêtre'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home'),
          ]),
    );
  }
}
