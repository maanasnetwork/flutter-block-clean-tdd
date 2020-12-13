import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routes.dart';
import '../../../config/theme.dart';
import '../../../domain/entities/validator.dart';
import '../sign_up/sign_up.dart';
import '../../widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<AppInputFieldState> emailKey = GlobalKey();
  final GlobalKey<AppInputFieldState> passwordKey = GlobalKey();
  final GlobalKey<AppInputFieldState> nameKey = GlobalKey();

  double sizeBetween;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      backgroundColor: AppColors.background,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          // on success delete navigator stack and push to home
          if (state is SignUpFinishedState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.home,
              (Route<dynamic> route) => false,
            );
          }
          // on failure show a snackbar
          if (state is SignUpErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          // show loading screen while processing
          if (state is SignUpProcessingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Container(
              height: height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppBlockHeader(title: 'Sign up', width: width),
                  SizedBox(
                    height: sizeBetween,
                  ),
                  AppInputField(
                    key: nameKey,
                    controller: nameController,
                    hint: 'Name',
                    validator: Validator.valueExists,
                  ),
                  AppInputField(
                    key: emailKey,
                    controller: emailController,
                    hint: 'Email',
                    validator: Validator.validateEmail,
                    keyboard: TextInputType.emailAddress,
                  ),
                  AppInputField(
                    key: passwordKey,
                    controller: passwordController,
                    hint: 'Password',
                    validator: Validator.passwordCorrect,
                    keyboard: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  AppRightArrow(
                    'Already have an account',
                    onClick: _showSignInScreen,
                  ),
                  AppButton(title: 'SIGN UP', onPressed: _validateAndSend),
                  SizedBox(
                    height: sizeBetween,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.linePadding),
                    child: Center(
                      child: Text('Or sign up with social account'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        AppServiceButton(
                          serviceType: ServiceType.Google,
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpPressedGoogle(),
                            );
                          },
                        ),
                        AppServiceButton(
                          serviceType: ServiceType.Facebook,
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpPressedFacebook(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSignInScreen() {
    Navigator.of(context).pushNamed(AppRoutes.signin);
  }

  void _validateAndSend() {
    if (nameKey.currentState.validate() != null) {
      return;
    }
    if (emailKey.currentState.validate() != null) {
      return;
    }
    if (passwordKey.currentState.validate() != null) {
      return;
    }
    BlocProvider.of<SignUpBloc>(context).add(
      SignUpPressed(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}
