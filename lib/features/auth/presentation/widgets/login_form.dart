import 'package:chat_app/core/widgets/show_toast_messege.dart';
import 'package:chat_app/features/auth/presentation/views/register_view.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_title.dart';
import 'package:chat_app/features/auth/presentation/widgets/default_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/default_text_field.dart';
import 'package:chat_app/features/auth/presentation/widgets/no_account_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bussiness_logic/bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          showToastMessage(message: state.message, isSuccessState: true);
        } else if (state is ErrorAuthState) {
          showToastMessage(message: state.message, isSuccessState: false);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTitle(title: "Login"),
                DefaultTextField(
                  prefixIcon: Icons.email_outlined,
                  controller: TextEditingController(),
                  labelText: "Email",
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultTextField(
                    // onsuffixPressed: () => cubit.changePassVisibilty(),
                    prefixIcon: Icons.lock,
                    // keyboardType: TextInputType.visiblePassword,
                    // suffixIcon: cubit.visibilityIcon,
                    controller: TextEditingController(),
                    labelText: "Password",
                    isPassword: true),
                const SizedBox(
                  height: 30,
                ),
                ConditionalBuilder(
                  condition: state is! LoadingAuthState,
                  builder: (context) => Defaultbutton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(LoginUserEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      }
                    },
                    text: "Log In",
                    icon: Icons.login,
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                NoAccountButton(
                    isLogin: true,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()),
                          (route) => false);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
