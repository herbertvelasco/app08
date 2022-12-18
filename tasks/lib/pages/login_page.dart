import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/button_custom_widget.dart';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general_witget.dart';
import 'package:tasks/ui/widgets/textfield_normal_widget.dart';
import 'package:tasks/ui/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/login.svg',
                height: 180.0,
              ),
              divider10(),
              Text(
                "Iniciar Session",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrymaryColor,
                ),
              ),
              divider10(),
              TextFieldNormalWidget(
                hintText: "Correo electronico",
                icon: Icons.email,
                controller: _emailController,
              ),
              divider10(),
              divider6(),
              TextFieldPasswordWidget(
                controller: _passwordController,
              ),
              divider20(),
              TextFieldNormalWidget(
                hintText: "Correo electronico",
                icon: Icons.email,
                controller: _emailController,
              ),
              divider10(),
              ButtonCustomWidget(
                text: "Iniciar Sesion",
                icon: "check",
                color: kBrandPrymaryColor,
              ),
              divider20(),
              Text(
                "Ingresa con tus redes sociales",
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Google",
                icon: "google",
                color: Color(0xfff84b2a),
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Facebook",
                icon: "facebook",
                color: Color(0xff5070CC0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
