import 'package:delivery_app/core/services/auth_service.dart';
import 'package:delivery_app/core/widgets/custom_drawer_tile.dart';
import 'package:flutter/material.dart';

import '../../features/settings/settings_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logout() async {
    final austhService = AuthService();

    await austhService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Icon(
              Icons.lock_open_rounded,
              size: 70,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
          ),
          CustomDrawerTile(
            title: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          CustomDrawerTile(
            title: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsView()),
              );
            },
          ),
          const Spacer(),
          CustomDrawerTile(
            title: 'L O G O U T',
            icon: Icons.logout,
            onTap: logout,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
