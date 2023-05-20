import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_tarde/core/config/app_errors.dart';
import 'package:forum_tarde/core/helpers/snackbar_helper.dart';
import 'package:forum_tarde/core/widgets/appbars/simple_appbar.dart';
import 'package:forum_tarde/core/widgets/buttons/primary_button.dart';
import 'package:forum_tarde/core/widgets/buttons/secondary_button.dart';
import 'package:forum_tarde/core/widgets/dialogs/loading_dialog.dart';
import 'package:forum_tarde/core/widgets/forms/email_input_field.dart';
import 'package:forum_tarde/core/widgets/forms/password_input_field.dart';
import 'package:forum_tarde/modules/login/controllers/login_controller.dart';
import 'package:forum_tarde/modules/login/models/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Login'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EmailInputField(
                label: 'Email',
                initialValue: controller.email,
                onSaved: controller.setEmail,
              ),
              PasswordInputField(
                label: 'Senha',
                initialValue: controller.password,
                onSaved: controller.setPassword,
              ),
              PrimaryButton(
                label: 'Entrar',
                onPressed: _onLogin,
              ),
              SecondaryButton(
                label: 'Registrar',
                onPressed: () => Modular.to.pushNamed('/register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _onLogin() async {
    if (!_formKey.currentState!.validate()) return;
    LoadingDialog.show(context);
    _formKey.currentState!.save();
    final result = await controller.login();
    LoadingDialog.hide();
    result.fold(_onFailure, _onSuccess);
  }

  void _onFailure(Failure failure) {
    SnackBarHelper.showFailureMessage(
      context,
      message: failure.message,
    );
  }

  void _onSuccess(UserModel user) {
    SnackBarHelper.showSuccessMessage(
      context,
      message: 'Login realizado com sucesso!',
    );
    //Modular.to.navigate('/home');
  }
}
