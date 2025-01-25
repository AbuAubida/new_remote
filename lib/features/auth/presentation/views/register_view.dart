import 'package:chat_app/features/auth/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';




class RegisterView extends StatelessWidget {
const  RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
   return AppBar(
        centerTitle: true,
        title: const Text("Register Page"),
      );
  }
  _buildBody(){
    return Padding(
        padding: const EdgeInsets.all(20),
        child:RegisterForm() ,
      );
  }
}
