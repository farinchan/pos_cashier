import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_cashier/presentation/bloc/drawer/drawer_bloc.dart';
import 'package:pos_cashier/presentation/pages/cashier_page.dart';
import 'package:pos_cashier/presentation/pages/category_page.dart';
import 'package:pos_cashier/presentation/pages/product_page.dart';
import 'package:pos_cashier/presentation/pages/report_page.dart';
import 'package:pos_cashier/presentation/pages/spending_page.dart';
import 'package:pos_cashier/presentation/pages/transaction_page.dart';

class DrawerPage extends StatelessWidget {
  static const String routeName = '/drawer';
  DrawerPage({super.key});

  final _advancedDrawerController = AdvancedDrawerController();

  static final List<Widget> _widgetOptions = <Widget>[
    const CashierPage(),
    const CategoryPage(),
    const ProductPage(),
    const TransactionPage(),
    const SpendingPage(),
    const ReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, state) {
        return AdvancedDrawer(
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
              ),
            ),
          ),
          openRatio: MediaQuery.of(context).size.width > 720 ? 0.15 : 0.6,
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: true,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: SafeArea(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/7652155?v=4',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<DrawerBloc>().add(const ChangeDrawer(0));
                      _advancedDrawerController.hideDrawer();
                    },
                    leading: const Icon(Icons.home),
                    title: const Text('Cashier'),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<DrawerBloc>().add(const ChangeDrawer(1));
                      _advancedDrawerController.hideDrawer();
                    },
                    leading: const Icon(Icons.account_circle_rounded),
                    title: const Text('Kategori'),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<DrawerBloc>().add(const ChangeDrawer(2));
                      _advancedDrawerController.hideDrawer();
                    },
                    leading: const Icon(Icons.favorite),
                    title: const Text('Produk'),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<DrawerBloc>().add(const ChangeDrawer(3));
                      _advancedDrawerController.hideDrawer();
                    },
                    leading: const Icon(Icons.settings),
                    title: const Text('Transaksi'),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<DrawerBloc>().add(const ChangeDrawer(4));
                      _advancedDrawerController.hideDrawer();
                    },
                    leading: const Icon(Icons.settings),
                    title: const Text('Pengeluaran'),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<DrawerBloc>().add(const ChangeDrawer(5));
                      _advancedDrawerController.hideDrawer();
                    },
                    leading: const Icon(Icons.settings),
                    title: const Text('Laporan'),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Advanced Drawer Example'),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            body: _widgetOptions
                .elementAt(state is DrawerChanged ? state.index : 0),
          ),
        );
      },
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
