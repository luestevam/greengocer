import 'package:flutter/material.dart';
import 'package:greengocer/src/config/custom_colors.dart';
import 'package:greengocer/src/models/item_model.dart';
import 'package:greengocer/src/pages/commons_widgets/quantity_widgets.dart';
import 'package:greengocer/src/services/utils_services.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.item});

  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Conteúdo
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: item.imgUrl,
                  child: Image.asset(item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nome quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            suffixText: item.unit,
                            value: 1,
                          ),
                        ],
                      ),

                      // preço

                      Text(
                        utilsServices.priceToCurrency(
                          item.price,
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),

                      //Descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              item.description,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Botão

                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                          onPressed: () {},
                          label: const Text(
                            'Add no carrinho',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon:
                              const Icon(Icons.shopping_cart_checkout_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
