import 'package:flutter/material.dart';        // Untuk Widget (Scaffold, Text, dll)
import 'package:flutter/services.dart';        // Untuk mengatur Status Bar
import 'login_screen.dart';                    // Untuk pindah ke halaman Login
import 'success_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF007BFF),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              
              // Judul sesuai Figma
              const Text(
                "Create an\naccount",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, height: 1.2),
              ),
              const SizedBox(height: 40),

              // Form Username or Email
              _buildTextField(
                controller: _usernameOrEmailController,
                hint: "Username or Email",
                icon: Icons.person,
              ),
              const SizedBox(height: 20),

              // Form Password
              _buildTextField(
                controller: _passwordController,
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
                isVisible: _isPasswordVisible,
                onVisibilityToggle: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
              const SizedBox(height: 20),

              // Form ConfirmPassword
              _buildTextField(
                controller: _confirmPasswordController,
                hint: "ConfirmPassword",
                icon: Icons.lock,
                isPassword: true,
                isVisible: _isConfirmPasswordVisible,
                onVisibilityToggle: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
              ),
              const SizedBox(height: 15),

              // Teks persetujuan
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 13, height: 1.4),
                  children: [
                    TextSpan(text: "By clicking the "),
                    TextSpan(text: "Register", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                    TextSpan(text: " button, you agree\nto the public offer"),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Create Account
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0056b3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // FUNGSI PINDAH HALAMAN DITAMBAHKAN DI SINI
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SuccessScreen()),
                    );
                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              const Center(child: Text("- OR Continue with -", style: TextStyle(color: Colors.white70))),
              const SizedBox(height: 20),

              // Tombol Social Media
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(Icons.g_mobiledata),
                  const SizedBox(width: 20),
                  _buildSocialIcon(Icons.apple),
                  const SizedBox(width: 20),
                  _buildSocialIcon(Icons.facebook),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Link kembali ke Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I Already Have an Account ", style: TextStyle(color: Color.fromARGB(247, 255, 253, 253))),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onVisibilityToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !isVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                onPressed: onVisibilityToggle,
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(icon, size: 30, color: Colors.black),
    );
  }
}