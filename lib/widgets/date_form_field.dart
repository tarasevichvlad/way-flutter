import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:way/search_icons.dart';

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
              return Stack(overflow: Overflow.visible, children: [
                IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  icon: Icon(
                    SearchIcons.calendar_outlilne,
                    color: Color.fromRGBO(18, 97, 107, 1),
                  ),
                  onPressed: () {
                    _selectDate(state);
                  },
                ),
                Positioned(
                    child: Container(
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
                                    ? DateFormat('yyyy-MM-dd')
                                        .format(state.value)
                                    : label,
                                style: TextStyle(
                                    color: Color.fromRGBO(18, 97, 107, 1),
                                    fontFamily: 'ComicSansMS',
                                    fontSize: 16),
                              )),
                    left: 40,
                    top: 8)
              ]);
            });
}
