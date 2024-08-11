import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:power_link_project/Controllers/controllers.login_page.dart';
import 'package:power_link_project/Screens/screen_google_map.dart';

class ScreenLoginPage extends StatelessWidget {
  ScreenLoginPage({super.key});

  final ControllersLoginPage controllerr = Get.put(ControllersLoginPage());
  static String pageId = "/ScreenLogin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade700,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 80),
                SvgPicture.asset(
                  'assets/logo.svg', // Ensure you have a logo.svg in the assets folder
                  height: 120,
                ),
                const SizedBox(height: 48),
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 48),
                _buildTextField(
                  onChanged: controllerr.setUsername,
                  hintText: 'Username',
                  icon: Icons.person,
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  onChanged: controllerr.setPassword,
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 48),
                Obx(() => ElevatedButton(
                      onPressed: controllerr.isValid
                          ? () {
                              Get.offAllNamed(ScreenGoogleMapScreen.pageId);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required Function(String) onChanged,
      required String hintText,
      required IconData icon,
      bool obscureText = false}) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        prefixIcon: Icon(icon, color: Colors.blue.shade700),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(
        fontSize: 18,
        color: Colors.blue.shade700,
      ),
    );
  }
}
