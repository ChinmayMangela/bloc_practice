import 'package:bloc_practice/authentication/data/model/user_model.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_bloc.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_event.dart';
import 'package:bloc_practice/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../bloc/auth_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordState() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _onSignInTap() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final user = UserModel(
        id: '',
        name: name,
        email: email,
        password: password,
      );
      context.read<AuthBloc>().add(SignUpRequested(user));
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  String? _validateName(String? name) {
    return Utils.nameValidator(name);
  }

  String? _validateEmail(String? email) {
    return Utils.emailValidator(email);
  }

  String? _validatePassword(String? password) {
    return Utils.passwordValidator(password);
  }

  String? _validateConfirmPassword(String? password) {
    return Utils.confirmPasswordValidator(password, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(backgroundColor: Colors.black, body: _buildBody(state));
      },
      listener: (context, state) {
        if (state is Authenticated) {
          navigatorKey.currentState!.pushReplacementNamed('/todoHome');
        } else if(state is EmailNotVerified) {
          navigatorKey.currentState!.pushReplacementNamed('/emailVerification');
        } else if (state is AuthError) {
          Utils.showSnackBar(state.errorMessage);
        } else if (state is AuthInfo) {
          Utils.showSnackBar(state.message);
        }
      },
    );
  }

  Widget _buildBody(AuthState state) {
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
              _buildNameField(),
              SizedBox(height: screenHeight * 0.03),
              _buildEmailField(),
              SizedBox(height: screenHeight * 0.03),
              _buildPasswordField(),
              SizedBox(height: screenHeight * 0.03),
              _buildConfirmPasswordField(),
              SizedBox(height: screenHeight * 0.03),
              _buildSignUpButton(state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadingText() {
    return Text(
      'Sign Up',
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildNameField() {
    return CustomTextField(
      hintText: 'Name',
      controller: _nameController,
      obscureText: false,
      isPasswordField: false,
      validator: _validateName,
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

  Widget _buildConfirmPasswordField() {
    return CustomTextField(
      hintText: 'Confirm Password',
      controller: _confirmPasswordController,
      obscureText: _obscureConfirmPassword,
      isPasswordField: true,
      togglePasswordState: _toggleConfirmPasswordState,
      validator: _validateConfirmPassword,
    );
  }

  Widget _buildSignUpButton(AuthState state) {
    return CustomButton(
      onTap: _onSignInTap,
      child:
          state is AuthLoading
              ? CircularProgressIndicator()
              : Text(
                'Sign Up',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
    );
  }
}
