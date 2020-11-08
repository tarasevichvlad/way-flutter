import 'package:flutter/material.dart';
import 'package:way/search_icons.dart';
import 'package:way/utils/constants.dart';

class TimeFormField extends FormField<TimeOfDay> {
  static Future<Null> _selectTime(FormFieldState<TimeOfDay> state) async {
    final TimeOfDay picked = await showTimePicker(
        context: state.context, initialTime: TimeOfDay.now());
    if (picked != null && picked != state.value) {
      state.didChange(picked);
    }
  }

  TimeFormField(
      {FormFieldSetter<TimeOfDay> onSaved,
      FormFieldValidator<TimeOfDay> validator,
      TimeOfDay initialValue,
      bool autovalidate = false,
      String label = 'Во сколько?'})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autovalidate,
            builder: (FormFieldState<TimeOfDay> state) {
              return GestureDetector(
                  onTap: () {
                    _selectTime(state);
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          SearchIcons.clock,
                          size: 20,
                          color: Constants.baseColor,
                        ),
                        margin: EdgeInsets.only(right: 20),
                      ),
                      Container(
                          width: 250,
                          child: state.hasError
                              ? Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Text(
                                    state.errorText,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : Text(
                                  state.value != null
                                      ? state.value.format(state.context)
                                      : label,
                                  style: Constants.getDefaultStyle(16),
                                ))
                    ],
                  ));
            });
}
