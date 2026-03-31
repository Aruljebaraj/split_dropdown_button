import 'package:flutter_bloc/flutter_bloc.dart';

import 'split_dropdown_event.dart';
import 'split_dropdown_state.dart';

class SplitDropdownBloc extends Bloc<SplitDropdownEvent, SplitDropdownState> {
  SplitDropdownBloc() : super(SplitDropdownInitial()) {
    on<SelectItemEvent>((event, emit) {
      emit(SplitDropdownSelected(event.selectedItem));
    });
    on<OnButtonPressEvent>((event, emit) async {
      emit(SplitDropdownButtonPressedLoading());

      try {
        await event.onPress(); // Await the callback
        emit(SplitDropdownButtonPressedSuccess());
      } catch (e) {
        // optionally: emit a failure state
        emit(SplitDropdownInitial()); // or a custom error state
      }
    });
  }
}
