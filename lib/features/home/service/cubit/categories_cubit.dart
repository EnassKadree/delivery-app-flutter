import 'package:bloc/bloc.dart';
import 'package:delivery_app/features/app/model/category.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> 
{
  CategoriesCubit() : super(CategoriesInitial());
  
}
