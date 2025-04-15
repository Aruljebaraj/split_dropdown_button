abstract class SplitDropdownEvent {}

class SelectItemEvent extends SplitDropdownEvent {
  final String selectedItem;

  SelectItemEvent(this.selectedItem);
}

class OnButtonPressEvent extends SplitDropdownEvent {
  final String value;

  OnButtonPressEvent(this.value);
}
