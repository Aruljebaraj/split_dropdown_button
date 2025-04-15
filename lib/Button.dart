import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/SplitDropdownBloc.dart';
import 'Bloc/SplitDropdownEvent.dart';
import 'Bloc/SplitDropdownState.dart';

class SplitDropdownButton extends StatelessWidget {
  final List<String> options;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? dividerColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  /// Callback when an item is selected from the dropdown
  final Function(String selected)? onSelected;

  /// Callback when the main button is pressed
  final Function(String value)? onMainButtonPressed;

  const SplitDropdownButton({
    super.key,
    required this.options,
    this.textStyle,
    this.buttonColor,
    this.dividerColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onSelected,
    this.onMainButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplitDropdownBloc(),
      child: Builder(
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: buttonColor ?? Colors.blue,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<SplitDropdownBloc, SplitDropdownState>(
                  builder: (context, state) {
                    String displayText = 'Select Item';
                    String? selectedValue;

                    if (state is SplitDropdownSelected) {
                      displayText = state.selectedValue;
                      selectedValue = state.selectedValue;
                    }

                    return TextButton.icon(
                      onPressed: () {
                        if (selectedValue != null) {
                          onMainButtonPressed?.call(selectedValue);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No value selected yet'),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      icon: prefixIcon ?? const Icon(Icons.list, color: Colors.white),
                      label: Text(
                        displayText,
                        style: textStyle ??
                            const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),

                // Divider
                Container(
                  height: 40,
                  width: 1,
                  color: dividerColor ?? Colors.white.withOpacity(0.5),
                ),

                // Dropdown Arrow
                PopupMenuButton<String>(
                  onSelected: (value) {
                    BlocProvider.of<SplitDropdownBloc>(context)
                        .add(SelectItemEvent(value));
                    onSelected?.call(value);
                  },
                  itemBuilder: (context) => options
                      .map(
                        (opt) => PopupMenuItem(
                      value: opt,
                      child: Text(opt),
                    ),
                  )
                      .toList(),
                  icon: suffixIcon ??
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
