import 'package:chat_app/core/widgets/show_toast_messege.dart';
import 'package:chat_app/features/auth/presentation/bussiness_logic/bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_title.dart';
import 'package:chat_app/features/auth/presentation/widgets/default_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/default_text_field.dart';
import 'package:chat_app/features/auth/presentation/widgets/no_account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
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
                AuthTitle(title: "Register"),
                DefaultTextField(
                  prefixIcon: Icons.person,
                  controller: nameController,
                  labelText: "name",
                  isPassword: false,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultTextField(
                  prefixIcon: Icons.email_outlined,
                  controller: emailController,
                  labelText: "Email",
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultTextField(
                    prefixIcon: Icons.lock,
                    // keyboardType: TextInputType.visiblePassword,

                    controller: passwordController,
                    labelText: "Password",
                    isPassword: true),
                const SizedBox(
                  height: 30,
                ),
                DefaultTextField(
                  prefixIcon: Icons.phone,
                  controller: phoneController,
                  labelText: "phone",
                  isPassword: false,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 30,
                ),
                state is LoadingAuthState
                    ? LinearProgressIndicator()
                    : Defaultbutton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(RegitsterUserEvent(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },
                        text: "Register",
                        icon: Icons.login,
                      ),
                NoAccountButton(
                    isLogin: false,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                          (route) => false);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
