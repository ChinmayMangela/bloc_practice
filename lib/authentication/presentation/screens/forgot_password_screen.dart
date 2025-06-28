import 'package:bloc_practice/authentication/presentation/bloc/auth_bloc.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_event.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_state.dart';
import 'package:bloc_practice/authentication/presentation/widgets/custom_button.dart';
import 'package:bloc_practice/authentication/presentation/widgets/custom_text_field.dart';
import 'package:bloc_practice/main.dart';
import 'package:bloc_practice/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  String? _validateEmail(String? email) {
    return Utils.emailValidator(email);
  }

  void _onForgotPasswordTap() {
    final email = _emailController.text.trim();
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthForgotPasswordRequested(email));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          navigatorKey.currentState!.pop();
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      backgroundColor: Colors.black,
      title: Text(
        'Forgot Password',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildBody() {
    return BlocListener(
      listener: (context, state) {
        if (state is ForgotPasswordFailure) {
          Utils.showSnackBar(state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmailField(),
                const SizedBox(height: 16),
                _buildForgotPasswordButton(context.watch<AuthBloc>().state),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      obscureText: false,
      isPasswordField: false,
      hintText: 'Email',
      validator: _validateEmail,
    );
  }

  Widget _buildForgotPasswordButton(AuthState state) {
    return CustomButton(
      onTap: _onForgotPasswordTap,
      child:
          state is ForgotPasswordLoading
              ? const CircularProgressIndicator()
              : Text(
                'Forgot Password',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
    );
  }
}
