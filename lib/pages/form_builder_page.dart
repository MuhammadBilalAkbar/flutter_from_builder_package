import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormBuilderPage extends StatefulWidget {
  const FormBuilderPage({super.key, required this.title});

  final String title;

  @override
  State<FormBuilderPage> createState() => _FormBuilderPageState();
}

class _FormBuilderPageState extends State<FormBuilderPage> {
  final formKey = GlobalKey<FormBuilderState>();

  List<String> genderOptions = ['Male', 'Female', 'Other'];

  Future<bool> onWillPop() async {
    debugPrint('onWillPop set to false');
    return false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FormBuilder(
          key: formKey,
          onChanged: () => debugPrint('From has been changed.'),
          onWillPop: onWillPop,
          initialValue: const {
            'TextField1': '',
            'TextField2': '',
          },
          skipDisabled: true,
          // This does not save and read the disabled textFields.
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'TextField1',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: 'Enter no',
                      fillColor: Colors.white70,
                    ),
                    validator: FormBuilderValidators.equal('no'),
                    onChanged: (value) => debugPrint(value),
                    valueTransformer: (value) => value?.toUpperCase(),
                  ),
                  const SizedBox(height: 8),
                  FormBuilderTextField(
                    name: 'TextField2',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: 'Enter yes',
                      fillColor: Colors.white70,
                    ),
                    validator: FormBuilderValidators.equal('yes'),
                  ),
                  const SizedBox(height: 8),
                  FormBuilderCheckboxGroup(
                    name: 'Checkbox Group',
                    initialValue: const ['Subscribe'],
                    options: const [
                      FormBuilderFieldOption(
                        value: 'Like',
                        child: Text('Like'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Subscribe',
                        child: Text('Subscribe'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Share',
                        child: Text('Share'),
                      ),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please check at least one';
                      }
                      return null;
                    },
                  ),
                  FormBuilderRadioGroup(
                    name: 'Radio Group',
                    initialValue: 'Cat',
                    options: const [
                      FormBuilderFieldOption(
                        value: 'Turtle',
                        child: Text('Turtle'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Monkey',
                        child: Text('Monkey'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Dog',
                        child: Text('Dog'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Cat',
                        child: Text('Cat'),
                      ),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select one';
                      }
                      return null;
                    },
                  ),
                  FormBuilderDateRangePicker(
                    name: 'DateRange Picker',
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2030),
                    onChanged: (value) => debugPrint(value.toString()),
                    decoration:
                        const InputDecoration(labelText: 'DateRange Picker'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select DateRange';
                      }
                      return null;
                    },
                  ),
                  FormBuilderDateTimePicker(
                    name: 'DateTime Picker',
                    onChanged: (value) => debugPrint(value.toString()),
                    initialValue: DateTime.now(),
                    decoration:
                        const InputDecoration(labelText: 'DateTimer Picker'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select DateTime';
                      }
                      return null;
                    },
                  ),
                  FormBuilderDropdown(
                    name: 'Gender',
                    items: genderOptions
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    initialValue: genderOptions.first,
                    decoration:
                        const InputDecoration(labelText: 'DropDown Menu'),
                  ),
                  FormBuilderRangeSlider(
                    name: 'Range Slider',
                    min: 0,
                    max: 100,
                    initialValue: const RangeValues(0, 0),
                  ),
                  FormBuilderSwitch(
                    name: 'Switch',
                    title: const Text(
                      'Accept terms & conditions',
                      style: TextStyle(fontSize: 25),
                    ),
                    initialValue: true,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Reset form
                      formKey.currentState?.reset();
                      // Optional: unfocus keyboard
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text('Reset'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // // Save fields
                      // formKey.currentState?.fields['TextField2']?.save();
                      // // Read fields
                      // final readTextFieldData =
                      //     formKey.currentState?.fields['TextField2']?.value;
                      // // Save whole form
                      formKey.currentState?.save();
                      // Read whole form. First save and then read all values.
                      final readFormData = formKey.currentState?.value;
                      debugPrint(readFormData.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            readFormData.toString(),
                            // readFormData,
                            textScaleFactor: 1.5,
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
                    child: const Text('Read'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Validate whole form
                      final validationResult = formKey.currentState!.validate();

                      if (validationResult) {
                        formKey.currentState?.save();
                        debugPrint('Form Validation: $validationResult');
                        final readFormData = formKey.currentState?.value;
                        debugPrint(readFormData.toString());
                      }
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
