import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account Section
          const Text(
            "Account",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  subtitle: const Text("Update your account info"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text("Change Password"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Notifications Section
          const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text("Push Notifications"),
                  value: true,
                  onChanged: (val) {},
                  secondary: const Icon(Icons.notifications_active),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text("Email Notifications"),
                  value: false,
                  onChanged: (val) {},
                  secondary: const Icon(Icons.email),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Preferences Section
          const Text(
            "Preferences",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.palette),
                  title: const Text("Theme"),
                  subtitle: const Text("Light / Dark Mode"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text("Language"),
                  subtitle: const Text("Select app language"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Other Section
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
