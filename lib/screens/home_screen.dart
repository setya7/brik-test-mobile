/*
 * @Author: christyastama
 * @Date: 12/09/24 at 21.18
 */

import 'package:briktestklontong21/routers/router_name.dart';
import 'package:briktestklontong21/widgets/x_navigator.dart';
import 'package:briktestklontong21/x_src/x_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/product/product_bloc.dart';
import '../x_src/x_assets_src.dart';
import '../x_src/x_helper.dart';
import '../x_src/x_lazy_load.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Klontong21"),
        automaticallyImplyLeading: false,
      ),
      body: const ProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigate(context).pushNamed(RouterName.addUpdateProduct).then((value) {
            logger.i(value);
            if (value == 'refresh') {
              context.read<ProductBloc>().products.clear();
              context.read<ProductBloc>().add(GetAllProduct());
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Just for show the scalton we use [StatefulWidget]
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final LazyLoad _lazyLoad = LazyLoad();

  @override
  void initState() {
    super.initState();
    _lazyLoad.onListener(onLoadMore: () {
      context.read<ProductBloc>().add(GetAllProduct());
    });
  }

  @override
  Widget build(BuildContext context) {
    var productBloc = context.read<ProductBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: XSpace.marginL, right: XSpace.marginL),
            child: TextFormField(
              controller: context.read<ProductBloc>().etSearchProduct,
              onChanged: (val) {
                if (context.read<ProductBloc>().etSearchProduct.text.isEmpty) {
                  context.read<ProductBloc>().products.clear();
                  context.read<ProductBloc>().add(GetAllProduct());
                } else {
                  context.read<ProductBloc>().add(SearchProduct(val));
                }
              },
              decoration: const InputDecoration(suffixIcon: Icon(Icons.search), label: Text('Search')),
            ),
          ),
          Expanded(
            child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ProductSuccess) {
                  if (productBloc.products.isNotEmpty){
                    productBloc.products.addAll(state.products);
                  } else {
                    productBloc.products = state.products;
                  }
                }
            
                if (state is ProductSearchSuccess) {
                  productBloc.products = state.products;
                }
              },
              builder: (context, state) {
                var itemsProduct = productBloc.products;
                if (state is ProductFailed) {
                  return const Text("Product load failed");
                }
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
            
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<ProductBloc>().products.clear();
                    context.read<ProductBloc>().add(GetAllProduct());
                  },
                  child: ListView.builder(
                    controller: _lazyLoad.controller,
                    itemCount: productBloc.products.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        navigate(context).pushNamed(RouterName.detailProduct, arguments: itemsProduct[index]);
                      },
                      leading: Image.network(
                        itemsProduct[index].image ?? "",
                        fit: BoxFit.cover,
                        width: 100.0,
                        height: 100.0,
                        errorBuilder: (b, o, s) {
                          return Image.asset(XR.assets.defaultImg);
                        },
                      ),
                      title: Text("${itemsProduct[index].name}"),
                      subtitle: Text("${itemsProduct[index].description}"),
                    ),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadmore){
                return Padding(
                  padding: const EdgeInsets.all(XSpace.marginM),
                  child: Transform.scale(
                      scale: 0.8,
                      child: const CircularProgressIndicator()),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
