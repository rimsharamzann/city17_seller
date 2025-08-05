import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'display_state.dart';

class DisplayCubit extends Cubit<DisplayState> {
  DisplayCubit() : super(DisplayInitial());
}
