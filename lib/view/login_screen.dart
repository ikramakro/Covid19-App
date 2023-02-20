import 'package:api_boilerplate/utils/constant/textstyle.dart';
import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:api_boilerplate/utils/utils.dart';
import 'package:api_boilerplate/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  FocusNode emailfocus = FocusNode();

  FocusNode passwordfocus = FocusNode();
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    emailfocus.dispose();
    passwordfocus.dispose();
    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login With The Follwing credentials',
                  style: extraLargeText,
                ),
                const Text(
                  'Email: eve.holt@reqres.in',
                  style: largeText,
                ),
                const Text(
                  'Password: pistol',
                  style: largeText,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailfocus,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(context, emailfocus, passwordfocus);
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'email is required'),
                    EmailValidator(errorText: 'Email is not correct '),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                  valueListenable: obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordcontroller,
                      obscureText: obsecurePassword.value,
                      obscuringCharacter: '*',
                      focusNode: passwordfocus,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            obsecurePassword.value = !obsecurePassword.value;
                          },
                          child: Icon(obsecurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'password is required'),
                        MinLengthValidator(6,
                            errorText: 'Password is less than 6')
                      ]),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final form = _formkey.currentState!;
                    if (form.validate()) {
                      Map data = {
                        'email': emailcontroller.text.toString(),
                        'password': passwordcontroller.text.toString()
                      };
                      authViewModel.loginapi(data, context);
                    } else {
                      Utils.flushBar(context, 'form is not validate');
                    }
                  },
                  child: const Text('Login'),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signup);
                    },
                    child: const Text('Don\'t have an account? SignUp'))
              ]),
        ),
      ),
    );
  }
}
