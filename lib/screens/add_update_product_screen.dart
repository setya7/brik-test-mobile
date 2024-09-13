/*
 * @Author: christyastama
 * @Date: 12/09/24 at 23.36
 */

import 'dart:ffi';

import 'package:briktestklontong21/blocs/update_product/update_product_bloc.dart';
import 'package:briktestklontong21/routers/router_name.dart';
import 'package:briktestklontong21/widgets/x_navigator.dart';
import 'package:briktestklontong21/x_src/x_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/add_product/add_product_bloc.dart';
import '../models/product_model.dart';
import '../repositories/product_repository.dart';
import '../x_src/x_helper.dart';

class AddUpdateProductScreen extends StatefulWidget {
  final ProductModel? productModel;

  const AddUpdateProductScreen({super.key, this.productModel});

  @override
  State<AddUpdateProductScreen> createState() => _AddUpdateProductScreenState();
}

class _AddUpdateProductScreenState extends State<AddUpdateProductScreen> {
  final etName = TextEditingController();
  final etDescription = TextEditingController();
  final etHeight = TextEditingController();
  final etWidth = TextEditingController();
  final etLength = TextEditingController();
  final etWeight = TextEditingController();
  final etPrice = TextEditingController();
  final etCategoryName = TextEditingController();
  String image = "";

  @override
  void initState() {
    super.initState();
    logger.i(widget.productModel?.toJson());
    if (widget.productModel != null) {
      etName.text = widget.productModel?.name ?? "";
      etDescription.text = widget.productModel?.description ?? "";
      if (widget.productModel?.height != null) {
        etHeight.text = widget.productModel!.height.toString();
      }
      if (widget.productModel?.width != null) {
        etWidth.text = widget.productModel!.width.toString();
      }
      if (widget.productModel?.length != null) {
        etLength.text = widget.productModel!.length.toString();
      }
      if (widget.productModel?.weight != null) {
        etWeight.text = widget.productModel!.weight.toString();
      }
      if (widget.productModel?.price != null) {
        etPrice.text = widget.productModel!.price.toString();
      }
      if (widget.productModel?.categoryName != null) {
        etCategoryName.text = widget.productModel!.categoryName!;
      }
      if (widget.productModel?.image != null) {
        image = widget.productModel!.image!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddProductBloc, AddProductState>(
          listener: (context, state) {
            logger.i("state $state");
            if (state is AddProductSuccess) {
              navigate(context).pop('refresh');
            }
          },
        ),
        BlocListener<UpdateProductBloc, UpdateProductState>(
          listener: (context, state) {
            if (state is UpdateProductSuccess) {
              navigate(context).pushReplacementNamed(RouterName.mainHome);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Add product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(XSpace.marginL),
          child: Column(
            children: [
              TextFormField(
                controller: etName,
                decoration: const InputDecoration(label: Text("Product name")),
              ),
              TextFormField(
                controller: etDescription,
                decoration: const InputDecoration(label: Text("Description")),
              ),
              TextFormField(
                controller: etCategoryName,
                decoration: const InputDecoration(label: Text("Category name")),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: etHeight,
                      decoration: const InputDecoration(label: Text("Height")),
                    ),
                  ),
                  const SizedBox(
                    width: XSpace.spaceL,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: etWidth,
                      decoration: const InputDecoration(label: Text("Width")),
                    ),
                  ),
                  const SizedBox(
                    width: XSpace.spaceL,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: etLength,
                      decoration: const InputDecoration(label: Text("Length")),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: etWeight,
                decoration: const InputDecoration(label: Text("Weight")),
              ),
              TextFormField(
                controller: etPrice,
                decoration: const InputDecoration(label: Text("Price")),
              ),
              const SizedBox(
                height: XSpace.spaceL,
              ),
              (widget.productModel != null)
                  ? BlocBuilder<UpdateProductBloc, UpdateProductState>(
                      builder: (context, state) {
                        if (state is UpdateProductLoading) {
                          return const CircularProgressIndicator();
                        }

                        return ElevatedButton(
                          onPressed: () {
                            context.read<UpdateProductBloc>().add(UpdateProduct(ProductModel(
                                id: widget.productModel?.id,
                                name: etName.text,
                                height: int.parse(etHeight.text),
                                width: int.parse(etWidth.text),
                                length: int.parse(etLength.text),
                                description: etDescription.text,
                                price: int.parse(etPrice.text),
                                categoryName: etCategoryName.text)));
                          },
                          child: const Text('Update Product'),
                        );
                      },
                    )
                  : BlocBuilder<AddProductBloc, AddProductState>(
                      builder: (context, state) {
                        if (state is AddProductLoading) {
                          return const CircularProgressIndicator();
                        }
                        return ElevatedButton(
                          onPressed: () {
                            context.read<AddProductBloc>().add(AddProduct(ProductModel(
                                name: etName.text,
                                height: int.parse(etHeight.text),
                                width: int.parse(etWidth.text),
                                length: int.parse(etLength.text),
                                description: etDescription.text,
                                price: int.parse(etPrice.text),
                                categoryName: etCategoryName.text)));
                          },
                          child: const Text('Add Product'),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
