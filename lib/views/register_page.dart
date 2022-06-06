import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_register/core/extensions/extensions.dart';
import 'package:flutter_login_register/views/success_page.dart';
import 'package:flutter_login_register/views/widgets/custom_form_field.dart';
import 'package:flutter_login_register/views/widgets/custom_image_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageFormField(
              validator: (val) {
                if (val == null) return 'Pick a picture';
                return null;
              },
              onChanged: (file) {},
            ),
            CustomFormField(
              hintText: 'Name',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
              ],
              validator: (val) {
                if (val != null && !val.isValidName) {
                  return 'Enter valid name';
                }
                return null;
              },
            ),
            CustomFormField(
              hintText: 'Email',
              validator: (val) {
                if (val != null && !val.isValidEmail) {
                  return 'Enter valid email';
                }
                return null;
              },
            ),
            CustomFormField(
              hintText: 'Phone',
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r"[0-9]"),
                )
              ],
              validator: (val) {
                if (val != null && !val.isValidPhone) {
                  return 'Enter valid phone';
                }
                return null;
              },
            ),
            CustomFormField(
              hintText: 'Password',
              validator: (val) {
                if (val != null && !val.isValidPassword) {
                  return 'Enter valid password';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessPage(),
                        ));
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
