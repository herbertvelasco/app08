import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/button_custom_widget.dart';
import 'package:tasks/ui/widgets/general_witget.dart';
import 'package:tasks/ui/widgets/textfield_normal_widget.dart';
import 'package:tasks/ui/widgets/textfield_password_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

final TextEditingController _emailController =TextEditingController();
final TextEditingController _passwordController =TextEditingController();
final TextEditingController _fullnameController =TextEditingController();

_registerUser()async{
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email, 
    password: password,);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              divider20()
              SvgPicture.asset(
                'assets/images/register.svg',
                height: 180.0,
              ),
              divider10(),
              Text(
                "registrate",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrymaryColor,
                ),
              ),
              divider20()
              TextFieldNormalWidget(
                hintText: "Nombre completo",
                icon: Icons.email,
                controller: _fullnameController,
              ),
              divider10(),
              divider6(),
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
              
              divider10(),
              ButtonCustomWidget(
                text: "Registrate",
                icon: "check",
                color: kBrandPrymaryColor,
                onPressed: (){
                  _registerUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}