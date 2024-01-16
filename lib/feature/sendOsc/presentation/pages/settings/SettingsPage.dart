import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/home/EditButtonConfig.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/home/Home.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/settings/AboutPage.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/settings/OscCommandsweb.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/settings/PastNetworks.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/settings/buttonControls.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/home/EdtNetworkSettings.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/widgets/TopAppBar.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../../colors/Colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: darkappbar,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: background,
        child: Wrap(
          children: [
            Padding(padding: EdgeInsets.only(top: 10),
            child:  buildSettingCard(Icons.edit, 'Edit Button', 'Edit button configuration',(){
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(
                  builder: (context) => const Home()
              ), (route) => false);
            }),
            ),

            buildSettingCard(Icons.speed, 'Change Network', 'Add a new network',(){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConnectToNetwork()
                ),
              );
            }),
            buildSettingCard(Icons.info, 'About', 'Know About Laser Slides', (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AboutPage()
                ),
              );
            }),
            // buildSettingCard(Icons.book, 'OSC commands', 'Learn about OSC commands',(){
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => OscCommands()
            //     ),
            //   );
            // }

          ],
        ),
      ),
    );
  }
}


Widget buildSettingCard(IconData icon, String title, String subtitle, VoidCallback onPress) {
  return Card(
    elevation: 2.0,
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0), // Padding from top and bottom
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // No curved edges
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding for title and subtitle
      leading: Icon(icon), // Icon on the left
      title: Text(
        title,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
      ),
      onTap: () {
        // Handle tap event for the setting
        // You can navigate to a new page or perform some action here
        print('Tapped on $title');
        onPress.call();
      },
    ),
  );
}
