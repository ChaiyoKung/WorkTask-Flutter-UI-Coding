import 'package:flutter/material.dart';
// import 'package:flutter/src/material/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: Scaffold(
        // appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home_cut.png'), label: "Tab 1"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/account_cut.png'),
                label: "Tab 2"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Tab 3"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Tab 4"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Tab 5"),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey[400],
        ),
        body: Column(
          children: [MyAppBar(), HomePage()],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/icons/hara_logo.png'),
          IconButton(
            onPressed: null,
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/ad.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
