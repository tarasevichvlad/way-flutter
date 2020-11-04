import 'package:flutter/material.dart';
import 'package:way/search_icons.dart';

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
      bool autovalidate = false})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autovalidate,
            builder: (FormFieldState<TimeOfDay> state) {
              return Stack(overflow: Overflow.visible, children: [
                IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  icon: Icon(
                    SearchIcons.clock,
                    color: Color.fromRGBO(18, 97, 107, 1),
                  ),
                  onPressed: () {
                    _selectTime(state);
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
                                    ? state.value.format(state.context)
                                    : 'Во сколько?',
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
