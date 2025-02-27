import 'package:fitness_app/features/AuthFeature/presentation/screens/SignIn&SignUp/signup_screen.dart'
    show SignUpScreen;
import 'package:fitness_app/features/AuthFeature/presentation/widgets/auth_glass_container.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/create_route.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_text_field.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_text_password.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/or_divider.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/social_button.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_images.dart';
import '../../../../../../../core/constants/app_text_styles.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background2),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [_buildHeader(context), _buildAuthForm(context)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(AppImages.logo, height: 100.h)],
          ),
          SizedBox(height: 20.h),
          Text(S.of(context).heyThere, style: AppTextStyles.bodyText1),
          Text(S.of(context).welcomeBack, style: AppTextStyles.heading1),
        ],
      ),
    );
  }

  Widget _buildAuthForm(BuildContext context) {
    return AuthGlassContainer(
      width: 0.95.sw,
      height: 0.55.sh,
      child: Form(
        key: _formSignInKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(S.of(context).login, style: AppTextStyles.heading1),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _emailController,
                label: S.of(context).email,
                hint: S.of(context).enterYourEmail,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return S.of(context).pleaseEnterEmail;
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return S.of(context).invalidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomPasswordField(
                controller: _passwordController,
                label: S.of(context).password,
                hint: S.of(context).enterYourPassword,
              ),
              _buildForgotPassword(context),
              const OrDivider(),
              const SizedBox(height: 12),
              _buildSocialButtons(),
              const SizedBox(height: 20),
              CustomButton(
                title: S.of(context).login,
                onTap: _handleLogin,
                color: AppColors.mainColor,
                textColor: AppColors.fontColor1,
              ),
              _buildRegisterLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          S.of(context).forgotPassword,
          style: const TextStyle(
            color: AppColors.mainColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          icon: FontAwesomeIcons.google,
          onTap: () {},
          color: AppColors.bgColor,
          iconColor: Colors.white,
        ),
        const SizedBox(width: 20),
        SocialButton(
          icon: FontAwesomeIcons.facebook,
          onTap: () {},
          color: AppColors.bgColor,
          iconColor: Colors.white,
        ),
        const SizedBox(width: 20),
        SocialButton(
          icon: FontAwesomeIcons.apple,
          onTap: () {},
          color: AppColors.bgColor,
          iconColor: Colors.white,
        ),
      ],
    );
  }

  Widget _buildRegisterLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: const TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed:
              () => Navigator.push(
                context,
                CustomPageRoute(page: SignUpScreen()),
              ),
          child: Text(
            S.of(context).register,
            style: const TextStyle(color: AppColors.mainColor),
          ),
        ),
      ],
    );
  }

  void _handleLogin() {
    if (_formSignInKey.currentState!.validate()) {
      // Perform login logic
    }
  }
}

// Function to create a route for navigation to the SignUpScreen
