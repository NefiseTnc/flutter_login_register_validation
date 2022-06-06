import 'package:flutter/material.dart';
import 'package:flutter_login_register/validation/form_provider.dart';
import 'package:flutter_login_register/views/success_page.dart';
import 'package:flutter_login_register/views/widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late FormProvider _formProvider;

  @override
  Widget build(BuildContext context) {
    _formProvider = Provider.of<FormProvider>(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormField(
              hintText: 'Email',
              onChanged: _formProvider.validateEmail,
              errorText: _formProvider.email.error,
            ),
            CustomFormField(
              hintText: 'Password',
              onChanged: _formProvider.validatePassword,
              errorText: _formProvider.password.error,
            ),
            Consumer<FormProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (value.validate) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessPage(),
                          ));
                    }
                  },
                  child: const Text('submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
