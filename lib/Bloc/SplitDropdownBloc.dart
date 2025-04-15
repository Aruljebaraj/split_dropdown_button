import 'package:flutter_bloc/flutter_bloc.dart';

import 'SplitDropdownEvent.dart';
import 'SplitDropdownState.dart';

class SplitDropdownBloc extends Bloc<SplitDropdownEvent, SplitDropdownState> {
  SplitDropdownBloc() : super(SplitDropdownInitial()) {
    on<SelectItemEvent>((event, emit) {
      emit(SplitDropdownSelected(event.selectedItem));
    });
    on<OnButtonPressEvent>((event, emit) {
      emit(SplitDropdownButtonPressed(event.value));
    });
  }
}
