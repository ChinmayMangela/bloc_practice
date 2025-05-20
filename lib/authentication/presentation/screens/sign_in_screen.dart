import 'package:bloc_practice/utils/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;

  void _togglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? _validateEmail(String? email) {
    return Utils.emailValidator(email);
  }

  String? _validatePassword(String? password) {
    return Utils.passwordValidator(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildHeadingText(),
              SizedBox(height: 30),
              _buildEmailField(),
              SizedBox(height: 20),
              _buildPasswordField(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadingText() {
    return Text(
      'Sign In',
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      hintText: 'Email',
      controller: _emailController,
      obscureText: false,
      isPasswordField: false,
      validator: _validateEmail,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      hintText: 'Password',
      controller: _passwordController,
      obscureText: _obscurePassword,
      isPasswordField: true,
      togglePasswordState: _togglePasswordState,
      validator: _validatePassword,
    );
  }
}
