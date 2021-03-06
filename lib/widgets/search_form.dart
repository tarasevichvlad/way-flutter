import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:way/search_icons.dart';
import 'package:way/utils/constants.dart';
import 'package:way/widgets/date_form_field.dart';
import 'package:way/widgets/time_form_field.dart';

class TripModel {
  String from;
  String to;
  DateTime date;
  TimeOfDay time;
  int seats;
  bool onlyTwo;
  String comment;
  double price;
  DateTime dateArrive;
  TimeOfDay timeArrive;
  TripModel(
      {this.date,
      this.time,
      this.seats = 0,
      this.onlyTwo = false,
      this.from = '',
      this.to = ''});
}

class SearchForm extends StatefulWidget {
  GlobalKey<FormState> formKey;
  Function onSaved;
  bool autovalidate;
  List<Widget> children;
  bool isCreateMode = false;
  @override
  State<StatefulWidget> createState() => _SearchFormState(
      formKey: formKey,
      onSaved: onSaved,
      autovalidate: autovalidate,
      children: children,
      isCreateMode: isCreateMode);

  SearchForm(
      {this.formKey,
      this.onSaved,
      this.autovalidate,
      this.children,
      this.isCreateMode});
}

class _SearchFormState extends State<SearchForm> {
  List<Widget> children;
  GlobalKey<FormState> formKey;
  bool autovalidate;
  TripModel model = TripModel();
  Function onSaved;
  bool isCreateMode = false;
  EdgeInsets _defaultMargin = EdgeInsets.only(right: 18);

  _SearchFormState(
      {this.formKey,
      this.onSaved,
      this.autovalidate,
      this.isCreateMode,
      List<Widget> children = const []})
      : this.children = children;

  String _requiredValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> createModeWidget = isCreateMode
        ? [
            Container(
              height: 48,
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DateFormField(
                    onSaved: (DateTime date) {
                      model.dateArrive = date;
                      onSaved(model);
                    },
                    validator: (DateTime value) {
                      if (value == null) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    initialValue: model.dateArrive,
                    label: 'Дата приезда?',
                  )
                ],
              ),
            ),
            Container(
              height: 48,
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimeFormField(
                    onSaved: (TimeOfDay time) {
                      model.timeArrive = time;
                      onSaved(model);
                    },
                    validator: (TimeOfDay value) {
                      if (value == null) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    initialValue: model.timeArrive,
                    label: 'Время приезда?',
                  )
                ],
              ),
            ),
            Container(
              height: 48,
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Icon(
                        Icons.local_offer,
                        color: Constants.baseColor,
                      ),
                      margin: _defaultMargin),
                  Container(
                    width: 250,
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: _requiredValidator,
                        onSaved: (String val) {
                          model.price = double.parse(val);
                          onSaved(model);
                        },
                        decoration: InputDecoration(
                            hintText: 'За сколько?',
                            hintStyle: Constants.getDefaultStyle(16),
                            errorStyle: TextStyle(color: Colors.red))),
                  )
                ],
              ),
            )
          ]
        : [SizedBox()];
    List<Widget> textFields = [
      Container(
        height: 48,
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Icon(
                  SearchIcons.location,
                  color: Constants.baseColor,
                ),
                margin: _defaultMargin),
            Container(
              width: 250,
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: _requiredValidator,
                  onSaved: (String val) {
                    model.from = val;
                    onSaved(model);
                  },
                  decoration: InputDecoration(
                      hintText: 'Откуда?',
                      hintStyle: Constants.getDefaultStyle(16),
                      errorStyle: TextStyle(color: Colors.red))),
            )
          ],
        ),
      ),
      Container(
        height: 48,
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                SearchIcons.location,
                color: Constants.baseColor,
              ),
              margin: _defaultMargin,
            ),
            Container(
              width: 250,
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: _requiredValidator,
                  onSaved: (String val) {
                    model.to = val;
                    onSaved(model);
                  },
                  decoration: InputDecoration(
                      hintText: 'Куда?',
                      hintStyle: Constants.getDefaultStyle(16),
                      errorStyle: TextStyle(color: Colors.red))),
            )
          ],
        ),
      ),
      Container(
        height: 48,
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DateFormField(
              onSaved: (DateTime date) {
                model.date = date;
                onSaved(model);
              },
              validator: (DateTime value) {
                if (value == null) {
                  return 'Please enter some text';
                }
                return null;
              },
              initialValue: model.date,
            )
          ],
        ),
      ),
      Container(
        height: 48,
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimeFormField(
              onSaved: (TimeOfDay time) {
                model.time = time;
                onSaved(model);
              },
              validator: (TimeOfDay value) {
                if (value == null) {
                  return 'Please enter some text';
                }
                return null;
              },
              initialValue: model.time,
            )
          ],
        ),
      ),
      ...createModeWidget,
      Container(
        height: 48,
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Icon(
                  SearchIcons.airline_seat_recline_normal,
                  color: Constants.baseColor,
                ),
                margin: _defaultMargin),
            Container(
              width: 250,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: _requiredValidator,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSaved: (String val) {
                    model.seats = int.tryParse(val, radix: 10);
                    onSaved(model);
                  },
                  decoration: InputDecoration(
                      hintText: 'Сколько нужно мест?',
                      hintStyle: Constants.getDefaultStyle(16),
                      errorStyle: TextStyle(color: Colors.red))),
            )
          ],
        ),
      ),
      Container(
        height: 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              SearchIcons.users,
              color: Constants.baseColor,
            ),
            Container(
              width: 250,
              child: SwitchListTile(
                title: Text(
                  'Сзади только двое?',
                  style: Constants.getDefaultStyle(16),
                ),
                value: model.onlyTwo,
                onChanged: (value) {
                  setState(() {
                    model.onlyTwo = value;
                    onSaved(model);
                  });
                },
                activeColor: Constants.baseColor,
              ),
            )
          ],
        ),
      )
    ];
    textFields.addAll(children ?? []);
    return Container(
      child: Form(
          key: formKey,
          autovalidate: autovalidate,
          child: Column(
            children: textFields,
          )),
    );
  }
}
