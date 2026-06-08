import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';

class OffersViewBody extends StatelessWidget {
  OffersViewBody({super.key});

  final List<Product> products = [
    Product(
      name: "تفاح أحمر",
      price: 100,
      priceAfterDiscount: 80,
      discount: 20,
      image: "https://i.imgur.com/8Km9tLL.png",
    ),
    Product(
      name: "تفاح أحمر",
      price: 100,
      priceAfterDiscount: 80,
      discount: 20,
      image: "https://i.imgur.com/8Km9tLL.png",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class Product {
  final String name;
  final double price;
  final double priceAfterDiscount;
  final int discount;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.priceAfterDiscount,
    required this.discount,
    required this.image,
  });
}


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      //margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // Middle content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style:Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
                ),

                const SizedBox(height: 4),

                Text(
                  "${product.price.toStringAsFixed(2)} جنيه",
                  style:Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey[700]),
                ),

              ],
            ),
          ),

          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "${product.discount} % خصم",
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColor.mainColor),
                ),
              ),
              Text(
                'السعر بعد الخصم',
                style:Theme.of(context).textTheme.titleSmall,
              ),

              Text(
                "${product.priceAfterDiscount.toStringAsFixed(2)} جنيه",
                style:Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColor.mainColor),

              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.green,
                                width: 1,
                              ),
                            ),
                            child: Icon(Icons.edit,color: Colors.green,)

                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            child: Icon(Icons.delete_outline,color: Colors.red,)

                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}