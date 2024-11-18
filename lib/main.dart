import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadiran/providers/kehadiran_provider.dart';
import 'package:kehadiran/screens/kehadiran_screen.dart';
import 'package:kehadiran/screens/riwayat_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => KehadiranProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Kehadiran',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
      routes: {
        // '/': (context) => LoginPage(),
        // '/riwayat': (context) => RiwayatScreen(),
        '/profile' : (context)=> RiwayatScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    KehadiranScreen(),
    RiwayatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Pencatatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
