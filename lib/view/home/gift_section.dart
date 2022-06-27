import 'package:flutter/material.dart';

import '../../core/constant.dart';
import '../gift/gift_page.dart';
import 'home_page.dart';

class GiftSection extends StatelessWidget {
  const GiftSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const GiftPage()));
      },
      child: SizedBox(
        height: 148,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            Constant.gifts.length,
            (i) {
              double priceRatio =
                  duration.inHours * (30 / 24) / Constant.gifts[i]['price'];
              Constant.gifts.sort((a, b) => a['price'].compareTo(b['price']));
              return Container(
                width: 150,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            backgroundColor: Colors.blueGrey.shade50,
                            valueColor: AlwaysStoppedAnimation(Colors.purple),
                            value: priceRatio,
                          ),
                        ),
                        Text(
                            '${priceRatio > 1 ? 100 : (priceRatio * 100).toStringAsFixed(0)}')
                      ],
                    ),
                    Text(
                      '₺${Constant.gifts[i]['price']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(Constant.gifts[i]['title']),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
