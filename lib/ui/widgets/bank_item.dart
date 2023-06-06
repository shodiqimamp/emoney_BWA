import 'package:emoney_app/models/payment_method_model.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BankItem extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  const BankItem({
    super.key,
    required this.paymentMethod,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(
        22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border:
            Border.all(width: 2, color: isSelected ? blueColor : whiteColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            paymentMethod.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethod.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 Min',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
