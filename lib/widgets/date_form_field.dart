import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:way/search_icons.dart';
import 'package:way/utils/constants.dart';

class DateFormField extends FormField<DateTime> {
  static Future<Null> _selectDate(FormFieldState<DateTime> state) async {
    final DateTime picked = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        context: state.context);
    if (picked != null && picked != state.value) {
      state.didChange(picked);
    }
  }

  DateFormField(
      {FormFieldSetter<DateTime> onSaved,
      FormFieldValidator<DateTime> validator,
      DateTime initialValue,
      bool autovalidate = false,
      String label = 'Когда?'})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autovalidate,
            builder: (FormFieldState<DateTime> state) {
              return GestureDetector(
                onTap: () {
                  _selectDate(state);
                },
                child: Row(children: [
                  Container(
                      child: Icon(
                        SearchIcons.calendar_outlilne,
                        color: Constants.baseColor,
                        size: 20,
                      ),
                      margin: EdgeInsets.only(right: 20)),
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
                        : Container(
                            child: Text(
                                state.value != null
                                    ? DateFormat('yyyy-MM-dd')
                                        .format(state.value)
                                    : label,
                                style: Constants.getDefaultStyle(16)),
                          ),
                  )
                ]),
              );
            });
}
