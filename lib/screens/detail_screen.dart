/*
 * @Author: christyastama
 * @Date: 12/09/24 at 22.51
 */

import 'package:briktestklontong21/routers/router_name.dart';
import 'package:briktestklontong21/widgets/x_bottom_sheet.dart';
import 'package:briktestklontong21/widgets/x_navigator.dart';
import 'package:briktestklontong21/x_src/x_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/delete_product/delete_product_bloc.dart';
import '../models/product_model.dart';
import '../x_src/x_assets_src.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel? productModel;
  const DetailScreen({super.key, this.productModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.productModel?.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Detail Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(XSpace.marginL),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300.0,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(XSpace.marginM)),
                child: Image.network(
                  '${widget.productModel?.image}',
                  fit: BoxFit.cover,
                  errorBuilder: (b, o, s) {
                    return Image.asset(XR.assets.defaultImg);
                  },
                ),
              ),
              const SizedBox(
                height: XSpace.marginL,
              ),
              Text('${widget.productModel?.name}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: XSpace.marginM,
              ),
              Text('${widget.productModel?.categoryName}', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: XSpace.marginM,
              ),
              Text('${widget.productModel?.description}', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: XSpace.marginL, left: XSpace.marginL, bottom: XSpace.marginM),
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                navigate(context).pushNamed(RouterName.addUpdateProduct, arguments: widget.productModel);
              },
              child: const Text("Update"),
            )),
            const SizedBox(
              width: XSpace.marginM,
            ),
            BlocConsumer<DeleteProductBloc, DeleteProductState>(
              listener: (context, state) {
                if (state is DeleteProductSuccess) {
                  navigate(context).pushReplacementNamed(RouterName.mainHome);
                }
                if (state is DeleteProductFailed) {
                  showXBottomSheet(context,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.text ?? "Failed delete product"),
                          ),
                        ],
                      ));
                }
              },
              builder: (context, state) {
                if (state is DeleteProductLoading) {
                  return const CircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () {
                    showXBottomSheet(context,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("That's right you want to delete?", style: Theme.of(context).textTheme.titleLarge),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: XSpace.marginL,
                                ),
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {
                                    navigate(context).pop(true);
                                  },
                                  child: const Text("Yup"),
                                )),
                                const SizedBox(
                                  width: XSpace.marginL,
                                ),
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {
                                    navigate(context).pop(false);
                                  },
                                  child: const Text("Nay"),
                                )),
                                const SizedBox(
                                  width: XSpace.marginL,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: XSpace.marginL,
                            ),
                          ],
                        )).then((value) {
                      if (value == true) {
                        context.read<DeleteProductBloc>().add(DeleteProduct(widget.productModel?.id));
                      }
                    });
                  },
                  child: const Icon(Icons.delete),
                );
              },
            ),
            const SizedBox(
              width: XSpace.marginM,
            ),
          ],
        ),
      ),
    );
  }
}
