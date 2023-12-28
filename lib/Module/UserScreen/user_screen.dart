import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 363,
            //padding: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [HexColor('#155D93'), HexColor('#36353C')])),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100, left: 20),
                  child: Text("My Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150, left: 20),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/saleen.png'), // Replace with your image
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(top: 170, left: 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saleen Naser',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '010707000',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'saleel.saeed@gmail.com',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                // Adjust the space as per your design
              ],
            ),
          ),
          50.ph,
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildListTile(Icons.person, 'Personal Information'),
                20.ph,
                _buildListTile(Icons.document_scanner, 'Documents'),
                20.ph,
                _buildListTile(Icons.help, 'Help'),
                20.ph,
                _buildListTile(Icons.lock, 'Change Password'),
                20.ph,
                _buildListTile(Icons.logout, 'Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: HexColor('#155D93'),
      ),
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: HexColor('#155D93'),
      ),
      onTap: () {
        // Your navigation logic here
      },
    );
  }
}
