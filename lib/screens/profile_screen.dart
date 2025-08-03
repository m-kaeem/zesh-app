
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Profile', style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        children: [
          _buildProfileItem(icon: Icons.person_outline, text: 'Login', onTap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('General Settings', style: TextStyle(color: Colors.grey[600], fontSize: 16)),
          ),
          _buildDarkModeToggle(),
          _buildProfileItem(icon: Icons.language, text: 'Language', onTap: () {}),
          _buildProfileItem(icon: Icons.info_outline, text: 'About', onTap: () {}),
          _buildProfileItem(icon: Icons.article_outlined, text: 'Terms & Conditions', onTap: () {}),
          _buildProfileItem(icon: Icons.lock_outline, text: 'Privacy Policy', onTap: () {}),
          _buildProfileItem(icon: Icons.star_outline, text: 'Rate This App', onTap: () {}),
          _buildProfileItem(icon: Icons.share_outlined, text: 'Share This App', onTap: () {}),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProfileItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
      onTap: onTap,
    );
  }

  Widget _buildDarkModeToggle() {
    return ListTile(
      leading: Icon(Icons.brightness_6_outlined, color: Colors.grey[600]),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mode'),
          Text('Dark & Light', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
      trailing: Switch(
        value: _isDarkMode,
        onChanged: (value) {
          setState(() {
            _isDarkMode = value;
          });
        },
        activeColor: Colors.blue,
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 3,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.star_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
