part of 'lists.dart';



extension Orders on Lists {
  List<OrderModel> dummyOrders() {
    return [
      OrderModel(
        id: 1,
        status: "Pending",
        totalPrice: 200.0,
        address: "123 شارع رئيسي",
        customerId: 101,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      ),
      OrderModel(
        id: 2,
        status: "Completed",
        totalPrice: 150.0,
        address: "456 شارع فرعي",
        customerId: 102,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now(),
      ),
      OrderModel(
        id: 3,
        status: "Shipped",
        totalPrice: 300.0,
        address: "789 شارع المطار",
        customerId: 103,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now(),
      ),
      OrderModel(
        id: 4,
        status: "Cancelled",
        totalPrice: 100.0,
        address: "1010 شارع الجامعة",
        customerId: 104,
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        updatedAt: DateTime.now(),
      ),
    ];
  }
}
