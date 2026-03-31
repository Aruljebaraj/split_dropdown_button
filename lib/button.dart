import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/split_dropdown_bloc.dart';
import 'Bloc/split_dropdown_event.dart';
import 'Bloc/split_dropdown_state.dart';

class SplitDropdownButton extends StatelessWidget {
  final List<String> options;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? dividerColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String displayText;

  /// Callback when an item is selected from the dropdown
  final Function(String selected)? onSelected;

  /// Callback when the main button is pressed
  final Function()? onMainButtonPressed;

  const SplitDropdownButton({
    super.key,
    required this.options,
    required this.displayText ,
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
                    String display = displayText; // default fallback
                   // String? selectedValue;

                    if (state is SplitDropdownSelected) {
                      display = state.selectedValue;
                      //selectedValue = state.selectedValue;
                    }

                    return TextButton.icon(
                      onPressed: () {
                        // if (selectedValue != null) {
                        //   onMainButtonPressed?.call(selectedValue);
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('No value selected yet'),
                        //     ),
                        //   );
                        // }
                        onMainButtonPressed?.call();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      icon: prefixIcon ??
                          const Icon(Icons.list, color: Colors.white),
                      label: Text(
                        display,
                        style:
                            textStyle ?? const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),

                // Divider
                Container(
                  height: 40,
                  width: 1,
                  color: dividerColor ?? Colors.white.withValues(alpha: 0.5),
                ),

                // Dropdown Arrow
                PopupMenuButton<String>(
                  onSelected: (value) {
                    BlocProvider.of<SplitDropdownBloc>(context)
                        .add(SelectItemEvent(selectedItem: value));
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
