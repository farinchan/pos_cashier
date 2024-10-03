import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pos_cashier/common/helper.dart';
import 'package:pos_cashier/presentation/bloc/cart/cart_bloc.dart';
import 'package:pos_cashier/presentation/bloc/cashier_category/cashier_category_bloc.dart';
import 'package:pos_cashier/presentation/bloc/cashier_product/cashier_product_bloc.dart';
import 'package:pos_cashier/presentation/widget/textfield_custom.dart';

class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CashierCategoryBloc>().add(const FetchCategory());
    context.read<CashierProductBloc>().add(const FetchProduct());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFieldCustom(
                              hintText: "Search",
                              suffixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.qr_code),
                            label: const Text(
                              'Scan',
                              style: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                                // backgroundColor: constants.PrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<CashierCategoryBloc, CashierCategoryState>(
                      builder: (context, state) {
                        if (state is CashierCategoryLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CashierCategorySuccess) {
                          return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              height: 60,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.categories.length +
                                    1, // Tambahkan 1 ke itemCount
                                itemBuilder: (BuildContext context, int index) {
                                  // Jika index adalah 0, tampilkan widget yang ingin disisipkan
                                  if (index == 0) {
                                    return InkWell(
                                      onTap: () {
                                        log('First Widget Clicked');
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .blue, // Sesuaikan warna widget pertama
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('Semua'),
                                        ),
                                      ),
                                    );
                                  }

                                  // Jika index lebih dari 0, tampilkan data dari categories
                                  final categoryIndex = index -
                                      1; // Sesuaikan index karena widget pertama sudah dipakai
                                  return InkWell(
                                    onTap: () {
                                      log('Category Clicked');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(state
                                                .categories[categoryIndex]
                                                .name ??
                                            ''),
                                      ),
                                    ),
                                  );
                                },
                              ));
                        } else if (state is CashierCategoryFailure) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Expanded(
                      child:
                          BlocConsumer<CashierProductBloc, CashierProductState>(
                        listener: (context, state) {
                          if (state is CashierProductFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Terjadi kesalahan: ${state.message}"),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is CashierProductLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is CashierProductSuccess) {
                            return SingleChildScrollView(
                              child: Wrap(
                                children: state.data.map((e) {
                                  return Container(
                                    width: 190,
                                    height: 240,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        context.read<CartBloc>().add(AddProduct(
                                            id: e.id ?? 0,
                                            name: e.name ?? '',
                                            quantity: 1,
                                            price: e.price ?? 0));
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      e.image ?? ''),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.name ?? '',
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                      Helper.rupiahFormat(
                                                          e.price ?? 0),
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          } else if (state is CashierProductFailure) {
                            return Center(
                              child: Text(state.message),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Keranjang',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                              DateFormat('dd MMMM yyyy').format(DateTime.now()),
                              style: const TextStyle(fontSize: 12)),
                          Text("Dilayani oleh: Admin",
                              style: const TextStyle(fontSize: 12))
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CartLoaded) {
                        return ListView.builder(
                          itemCount: state.carts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cart = state.carts[index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(cart['name'] ?? ''),
                                        Text(
                                            '${cart['quantity']} x ${Helper.rupiahFormat(cart['price'])} = ${Helper.rupiahFormat(cart['price_total'])}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                              IncrementProduct(id: cart['id']));
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                      Text(cart['quantity'].toString()),
                                      IconButton(
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                              DecrementProduct(id: cart['id']));
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<CartBloc>()
                                          .add(RemoveProduct(id: cart['id']));
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Total'),
                          Spacer(),
                          BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is CartLoaded) {
                                return Text(
                                    Helper.rupiahFormat(state.total.toInt()));
                              } else {
                                return Container();
                              }
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<CartBloc>().add(ClearCart());
                              },
                              child: const Text('Batal'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Bayar'),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
          ),
        ],
      )),
    );
  }
}
