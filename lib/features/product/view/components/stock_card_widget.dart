
import 'package:delivery_app/core/Extensions/string_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/json_constants.dart';

class StockCardWidget extends StatelessWidget {
  const StockCardWidget({super.key, required this.stockCount});
  final int stockCount;
  @override
  Widget build(BuildContext context) 
  {
    String stockStatus = buildStockStatus(context);
    List<Color> backgroundGradient = buildStockGradient();
    

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: backgroundGradient),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${JsonConstants.stock.t(context)}:',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              Text(
                stockStatus,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> buildStockGradient() 
  {
    if (stockCount > 20) 
    {
      return AppColors.greenGradient;
    } else if (stockCount > 0 && stockCount <= 20) 
    {
      return AppColors.orangeGradient;
    } else 
    {
      return AppColors.redGradient;
    }
  }

  String buildStockStatus(BuildContext context)
  {
    if (stockCount > 20) 
    {
      return '${JsonConstants.available.t(context)}($stockCount ${JsonConstants.items.t(context)})';
    } else if (stockCount > 0 && stockCount <= 20) 
    {
      return '${JsonConstants.limited.t(context)} ($stockCount ${JsonConstants.items.t(context)})';
    } else 
    {
      return JsonConstants.outOfStock.t(context);
    }
  }
}
