import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newapps/profilepage.dart';
import 'package:newapps/widgets/communitypage.dart';
import 'package:newapps/timeline_page.dart'; // Import the Timeline Page

class HomePage extends StatelessWidget {
  final String stepCountValue;

  const HomePage({
    super.key,
    required this.stepCountValue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Buddy',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20,
          ),
          child: GNav(
            color: const Color(0xff0202fa),
            activeColor: const Color(0xffe7e7e7),
            hoverColor: const Color(0xffe7e7e7),
            tabBorderRadius: 20,
            tabBackgroundColor: const Color(0xff0202fa),
            curve: Curves.easeOut,
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                iconColor: const Color(0xff0202fa),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      HomePage(stepCountValue: stepCountValue),
                )),
              ),
              GButton(
                icon: Icons.group_outlined,
                text: 'Community',
                iconColor: const Color(0xff0202fa),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CommunityPage(),
                )),
              ),
              GButton(
                icon: Icons.person_outlined,
                text: 'Profile',
                iconColor: const Color(0xff0202fa),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                )),
              ),
              GButton(
                icon: Icons.timeline,
                text: 'Timeline',
                iconColor: const Color(0xff0202fa),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TimelinePage(),
                )),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [],
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0202fa),
              ),
              child: Text(
                'Total Steps: $stepCountValue',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Step counter: $stepCountValue',
                  style: const TextStyle(color: Color(0xff0202fa)),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Walk Hours',
                  style: TextStyle(color: Color(0xff0202fa)),
                ),
                const SizedBox(
                  width: 20,
                ),
                // Add a placeholder for calories if needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
