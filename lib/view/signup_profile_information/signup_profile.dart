import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/view/bottomnavbar/bottomnavbar.dart';
// import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({Key? key}) : super(key: key);

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

class _SignUpProfileScreenState extends State<SignUpProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  late SharedPreferences _preferences;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _checkRegistrationStatus();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> _checkRegistrationStatus() async {
    _preferences = await SharedPreferences.getInstance();
    bool isRegistered = _preferences.getBool('isRegistered') ?? false;
    if (!_isDisposed && isRegistered) {
      // Đã đăng ký trước đó, chuyển đến BottomNavBar
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
            (route) => false,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Current Address',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Lấy giá trị từ các trường và sử dụng
                String name = nameController.text;
                String phone = phoneController.text;
                String address = addressController.text;

                // Thực hiện xử lý dữ liệu ở đây
                // Ví dụ: Lưu vào cơ sở dữ liệu hoặc gửi yêu cầu đến API

                // Lưu trạng thái đã đăng ký
                _preferences.setBool('isRegistered', true);

                // Chuyển hướng đến BottomNavBar
                if (!_isDisposed && mounted) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavBar()),
                      (route) => false,
                    );
                  });
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
