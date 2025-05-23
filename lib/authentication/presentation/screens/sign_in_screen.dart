import 'package:bloc_practice/authentication/presentation/widgets/custom_button.dart';
import 'package:bloc_practice/authentication/presentation/widgets/custom_outline_button.dart';
import 'package:bloc_practice/main.dart';
import 'package:bloc_practice/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/string_constants.dart';
import '../widgets/custom_social_button.dart';
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

  void _onSignInTap() {
    if (_formKey.currentState!.validate()) {
      print(_emailController.text.trim());
      print(_passwordController.text.trim());
    }
  }

  void _onForgotPasswordTap() {
    navigatorKey.currentState!.pushNamed('/forgotPassword');
  }

  void _onSignUpTap() {
    navigatorKey.currentState!.pushNamed('/signUp');
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
    final screenHeight = Utils.getScreenHeight(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildHeadingText(),
              SizedBox(height: screenHeight * 0.03),
              _buildEmailField(),
              SizedBox(height: screenHeight * 0.03),
              _buildPasswordField(),
              SizedBox(height: screenHeight * 0.02),
              _buildForgotPasswordButton(),
              SizedBox(height: screenHeight * 0.02),
              _buildSignInButton(),
              SizedBox(height: screenHeight * 0.03),
              _buildOrMessage(),
              SizedBox(height: screenHeight * 0.03),
              _buildSignUpButton(),
              SizedBox(height: screenHeight * 0.03),
              _buildAppleSignInButton(),
              SizedBox(height: screenHeight * 0.03),
              _buildGoogleSignInButton(),
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

  Widget _buildSignInButton() {
    return CustomButton(label: 'Sign In', onTap: _onSignInTap);
  }

  Widget _buildOrMessage() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade900)),
        Text(
          ' Or ',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        Expanded(child: Divider(color: Colors.grey.shade900)),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return CustomOutlineButton(
      label: 'Sign Up with email',
      onTap: _onSignUpTap,
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _onForgotPasswordTap,
        child: Text('Forgot Password', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.grey
        ),),
      ),
    );
  }

  Widget _buildAppleSignInButton() {
    return CustomSocialButton(
      label: 'Sign In with Apple',
      onTap: () {},
      buttonColor: appleAuthButtonColor,
      icon: FontAwesomeIcons.apple,
    );
  }

  Widget _buildGoogleSignInButton() {
    return CustomSocialButton(
      label: 'Sign In with Google',
      onTap: () {},
      buttonColor: googleAuthButtonColor,
      icon: FontAwesomeIcons.google,
    );
  }
}
