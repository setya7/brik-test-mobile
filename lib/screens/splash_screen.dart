/*
 * @Author: christyastama
 * @Date: 12/09/24 at 21.17
 */

import 'package:briktestklontong21/blocs/splash/splash_bloc.dart';
import 'package:briktestklontong21/routers/router_name.dart';
import 'package:briktestklontong21/x_src/x_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/x_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SplashBloc()..add(SplashCheck()),
          ),
        ],
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashSuccess) {
              navigate(context).pushReplacementNamed(RouterName.mainHome);
            }
          },
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(XSpace.marginL),
                child: Text(
                  "Klontong21",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(XSpace.marginS),
                child: Icon(Icons.ramen_dining_outlined, size: 50, color: Theme.of(context).primaryColor),
              )
            ],
          )),
        ),
      ),
    );
  }
}
