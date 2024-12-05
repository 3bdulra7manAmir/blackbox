import 'package:black_box/modules/home/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeCubitStates>{
  HomeCubit() : super(InitalHomeState());
  
}