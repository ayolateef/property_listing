import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterflow_test/features/root/route/route.dart';
import 'package:flutterflow_test/utils/colors.dart';
import 'package:get_it/get_it.dart';

import '../../utils/asset_images.dart';
import '../../utils/button.dart';
import '../../utils/custom_text_field.dart';
import '../../utils/navigation/navigation_service.dart';
import '../../utils/validator.dart';



class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Page'),
        centerTitle: true,
        backgroundColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child: Image.asset(AssetResources.SPLASH_IMAGE)),
              20.verticalSpace,
              CustomTextField(
                textEditingController: _emailController,
                header: "Email",
                type: FieldType.email,
                validator:Validator.emailValidator
              ),
               SizedBox(height: 46.h),

              // Password TextField
              CustomTextField(
                textEditingController: _passwordController,
                header: "Password",
                obscureText: true,
                type: FieldType.password,
                validator: Validator.requiredValidator,
              ),
              SizedBox(height: 60.0.h),

              AppButton(
                height: 56,
                radius: 50.r,
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    signIn();
                  }
                },
                text: 'Login',
                color: AppColors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  void signIn() async {
    try {

      UserCredential? userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text
      );
        if(userCredential.user != null){
          GetIt.I<NavigationService>().clearAllTo(routeName: RootRoutes.root);
        }


    }on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        const snackBar = SnackBar(
          content: Text('No user found for that email.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        const snackBar = SnackBar(
          content: Text('Wrong password provided.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }



    }
  }
}
