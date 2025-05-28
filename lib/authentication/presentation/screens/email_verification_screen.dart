import 'dart:async';
import 'package:bloc_practice/authentication/presentation/bloc/auth_bloc.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_event.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_state.dart';
import 'package:bloc_practice/authentication/presentation/widgets/custom_button.dart';
import 'package:bloc_practice/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  Timer? _emailCheckTimer;

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(CheckEmailVerifiedRequested());

    FirebaseAuth.instance.currentUser!.reload();
    _emailCheckTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      context.read<AuthBloc>().add(CheckEmailVerifiedRequested());
    });
  }

  @override
  void dispose() {
    _emailCheckTimer?.cancel(); // Clean up
    super.dispose();
  }

  void _onResendEmailVerificationTap() {
    context.read<AuthBloc>().add(SendEmailVerificationRequested());
  }

  void _onCancelTap() {
    context.read<AuthBloc>().add(SignOutRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          navigatorKey.currentState!.pushReplacementNamed('/todoHome');
        } else if (state is UnAuthenticated) {
          navigatorKey.currentState!.pushReplacementNamed('/signIn');
        } else if (state is AuthError) {
          Utils.showSnackBar(state.errorMessage);
        } else if (state is AuthInfo) {
          Utils.showSnackBar(state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      title: Text(
        'Email Verification',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildResendEmailVerificationButton(),
            SizedBox(height: 10),
            _buildCancelButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildResendEmailVerificationButton() {
    return CustomButton(
      onTap: _onResendEmailVerificationTap,
      child: Text('Resend Email Verification'),
    );
  }

  Widget _buildCancelButton() {
    return CustomButton(onTap: _onCancelTap, child: Text('Cancel'));
  }
}
