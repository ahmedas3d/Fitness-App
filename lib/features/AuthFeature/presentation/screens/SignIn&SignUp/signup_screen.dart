import 'package:fitness_app/features/AuthFeature/presentation/screens/Grender/gender_screen.dart';
import 'package:fitness_app/features/AuthFeature/presentation/screens/SignIn&SignUp/signin_screen.dart';
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

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(AppImages.background2),
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
          Text(S.of(context).createAccount, style: AppTextStyles.heading1),
        ],
      ),
    );
  }

  Widget _buildAuthForm(BuildContext context) {
    return AuthGlassContainer(
      width: 0.95.sw, // نسبة 88% من عرض الشاشة
      height: 0.62.sh,
      child: Form(
        key: _formSignUpKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(S.of(context).login, style: AppTextStyles.heading1),

            const SizedBox(height: 12),
            CustomTextField(
              controller: _firstNameController,
              label: S.of(context).firstName,
              hint: S.of(context).enterYourFirstName,
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return S.of(context).pleaseEnterFirstName;
                if (value.length < 2) return S.of(context).nameTooShort;
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _lastNameController,
              label: S.of(context).lastName,
              hint: S.of(context).enterYourLastName,
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return S.of(context).pleaseEnterLastName;
                if (value.length < 2) return S.of(context).nameTooShort;
                return null;
              },
            ),
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
            const OrDivider(),
            const SizedBox(height: 12),
            _buildSocialButtons(),
            const SizedBox(height: 20),
            CustomButton(
              title: S.of(context).register,
              onTap: () {
                if (_formSignUpKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    CustomPageRoute(page: const GenderScreen()),
                  );
                }
              },
              color: AppColors.mainColor,
              textColor: AppColors.fontColor1,
            ),
            _buildRegisterLink(context),
          ],
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
                CustomPageRoute(page: SignInScreen()),
              ),
          child: Text(
            S.of(context).login,
            style: const TextStyle(color: AppColors.mainColor),
          ),
        ),
      ],
    );
  }
}
