import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_cashier/injection.dart';
import 'package:pos_cashier/presentation/bloc/cart/cart_bloc.dart';
import 'package:pos_cashier/presentation/bloc/cashier_category/cashier_category_bloc.dart';
import 'package:pos_cashier/presentation/bloc/cashier_product/cashier_product_bloc.dart';
import 'package:pos_cashier/presentation/bloc/drawer/drawer_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_cashier/presentation/pages/drawer_page.dart';

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DrawerBloc()..add(ChangeDrawer(0))),
        BlocProvider(create: (context) => getIt<CashierCategoryBloc>()),
        BlocProvider(create: (context) => getIt<CashierProductBloc>()),
        BlocProvider(create: (context) => getIt<CartBloc>()),
      ],
      child: MaterialApp.router(
          title: 'POS Cashier',
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.trackpad
            },
          ),
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          routerConfig:
              GoRouter(initialLocation: DrawerPage.routeName, routes: [
            GoRoute(
                path: DrawerPage.routeName,
                name: DrawerPage.routeName,
                builder: (context, state) => DrawerPage()),
          ])),
    );
  }
}
