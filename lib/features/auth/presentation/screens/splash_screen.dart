import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is CheckIsLoggedState) {
            if (state.isLogged) {
              Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
            } else {
              Navigator.of(context).pushReplacementNamed(Routes.signInRoute);
            }
          }
        },
        child: Center(
            child: TweenAnimationBuilder(
                duration: Duration(seconds: 3),
                tween: Tween<double>(begin: .5, end: 1),
                builder: (context, t, _) {
                  return Transform.scale(
                      scale: t, child: SvgPicture.asset(SvgAssets.routeLogo));
                })),
      ),
    );
  }
}
