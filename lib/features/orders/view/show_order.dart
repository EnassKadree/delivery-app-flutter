import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowOrderPage extends StatelessWidget 
{
  const ShowOrderPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold
    (
    );
  }
}

class ShowOrderPageWrapper extends StatelessWidget {
  const ShowOrderPageWrapper({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MultiBlocProvider(providers: 
    const [

    ], 
    child: const ShowOrderPage()
    );
  }
}