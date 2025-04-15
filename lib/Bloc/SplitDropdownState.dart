abstract class SplitDropdownState {}

class SplitDropdownInitial extends SplitDropdownState {}

class SplitDropdownSelected extends SplitDropdownState {
  final String selectedValue;

  SplitDropdownSelected(this.selectedValue);
}

class SplitDropdownButtonPressed extends SplitDropdownState {
  final String value;

  SplitDropdownButtonPressed(this.value);
}
