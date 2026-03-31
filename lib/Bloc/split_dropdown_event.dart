abstract class SplitDropdownEvent {}

class SelectItemEvent extends SplitDropdownEvent {
  final String selectedItem;

  SelectItemEvent({required this.selectedItem});
}

class OnButtonPressEvent extends SplitDropdownEvent {
  final Future<void> Function() onPress;
  OnButtonPressEvent({required this.onPress});
}