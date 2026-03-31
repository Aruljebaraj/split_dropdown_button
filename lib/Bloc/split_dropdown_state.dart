abstract class SplitDropdownState {}

class SplitDropdownInitial extends SplitDropdownState {}

class SplitDropdownSelected extends SplitDropdownState {
  final String selectedValue;
  SplitDropdownSelected(this.selectedValue);
}

class SplitDropdownButtonPressedLoading extends SplitDropdownState {}

class SplitDropdownButtonPressedSuccess extends SplitDropdownState {}
