## 1. Research: Flutter Form Builder Package

- Keywords:
    - flutter form builder
    - flutter form builder example
    - flutter form builder github
    - flutter form builder dropdown
    - flutter form builder date picker
    - flutter form builder validator
    - flutter form builder custom field
    - flutter form design example
    - flutter form field
    - flutter form example github
    - flutter form builder extra fields
    - dynamic form builder flutter
    - flutter form with multiple fields
    - flutter form controller
    - flutter textformfield onchanged validation
    - flutter form builder radiobutton
    - flutter form builder checkbox
    - flutter from builder tutorial
- Video Title: Flutter Form Builder with dropdown, date picker, validator, checkbox, custom fields with example on github


## 2. Research: Competitors

**Flutter Videos/Articles**

- 35K: https://www.youtube.com/watch?v=eGwq3_0K_Sg
- 19K: https://www.youtube.com/watch?v=7FBELQq808M
- 1.3K: https://www.youtube.com/watch?v=vO5oVOOfSi8
- 701: https://www.youtube.com/watch?v=d3HEu8K2nIo
- 478: https://www.youtube.com/watch?v=MtWe4spw45U
- https://pub.dev/packages/flutter_form_builder
- https://itnext.io/building-forms-in-flutter-is-fun-now-bdcab1f31f87
- https://medium.com/@danvickmiller/building-a-custom-flutter-form-builder-field-c67e2b2a27f4

**Android/Swift/React Videos**

- 20K: https://www.youtube.com/watch?v=r6VevlwjhU8
- 20K: https://www.youtube.com/watch?v=PkA1hJ2LNCQ
- 9.2K: https://www.youtube.com/watch?v=NW3acfQIeWQ
- 17K: https://www.youtube.com/watch?v=iWtK4Foy1ZI
- https://eurekacommunity.github.io/
- https://swift.libhunt.com/libs/form
- https://blog.smartnsoft.com/how-to-manage-forms-screens-easily-on-ios-with-swift-7787eb09a0d6
- https://github.com/TheJuki/KFormMaster
- https://androidexample365.com/generic-form-builder-in-kotlin/

**Great Features**
- Flutter form builder package helps in creation of forms in Flutter by removing the boilerplate code, reusing validation, react to changes, and collect final user input.
- You can find more features at [pub.dev](https://pub.dev/packages/flutter_form_builder) & [itnext.io](https://itnext.io/building-forms-in-flutter-is-fun-now-bdcab1f31f87)

**Problems from Videos**
- NA

**Problems from Flutter Stackoverflow**

- https://stackoverflow.com/questions/71100586/flutter-form-builder-errors
- https://stackoverflow.com/questions/74545452/flutter-formbuilder-how-to-to-disable-formbuildertextfield-based-on-another-f
- https://stackoverflow.com/questions/53424916/textfield-validation-in-flutter

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. This package helps in creation of forms in flutter by removing boilerplate code, using validations, react to changes, and collect final user input.
2. Main Points
    - FormBuilderTextField
    - FormBuilderCheckboxGroup, FormBuilderRadioGroup
    - FormBuilderDateRangePicker, FormBuilderDateTimePicker
    - FormBuilderDropdown, FormBuilderRangeSlider
    - FormBuilderSwitch
    - Rest, Read and Submit button for form.
3. This is very useful package to create any type of forms in flutter.

**The Structured Main Content**
1. Run `dart pub get flutter_form_builder` in terminal to add this package in your `pubspec.yaml` file. Import `import 'package:flutter_form_builder/flutter_form_builder.dart';` to use it anywhere in your project.
<br /> `flutter_from_builder` package is broken in many separated packages for ease of maintainability. These separated packages are `form_builder_validators`, `form_builder_file_picker`, `form_builder_image_picker`, and `form_builder_phone_field`.
<br />We will only use and explore `form_builder_validators` to validate our form in this project.
2. There is no need of setup for Android and iOS.
3. In `main.dart` file, `MyApp()` is being called.
4. In `my_app.dart`, `ThemeData` of MaterialApp is set and it calls `FormBuilderPage()`.
5. In `form_builder_page.dart` file, initialize these:
```dart
  final formKey = GlobalKey<FormBuilderState>();

  var genderOptions = ['Male', 'Female', 'Other'];

  Future<bool> onWillPop() async {
    debugPrint('onWillPop set to false');
    return false;
  }
```
formKey is set as global key of `FormBuilder`, `genderOptions` is initialized for dropdown options of `FormBuilderDropdown`. `onWillPop()` method is used so that user can not go back when he is filling the form.s
`FormBuilder` itself has many properties. `child` is its required property. Other properties are `onChanged`, `onWillPop`, `skipDisabled`, `enabled`, and `autovalidateMode`. We have used some of these:
```dart
          key: formKey,
          onChanged: () => debugPrint('From has been changed.'),
          onWillPop: onWillPop,
          initialValue: const {
            'TextField1': 'no',
            'TextField2': 'yes',
          },
          skipDisabled: true,
          // This does not save and read the disabled textFields.
```
- There are two two `FormBuilderTextField`s
<br />First is `TextField1`, `name` is required argument. Built-in validator of `FormBuilderTextField` is used `FormBuilderValidators.equal('no')` to force enter `no` in this field. When the form is being submitted, we can change string value to upper or lower case as well: `valueTransformer: (value) => value?.toUpperCase(),`
```dart
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
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    valueTransformer: (value) => value?.toUpperCase(),
                  ),
```
Second `FormBuilderTextField` is `TextField2`. It is similar to `TextField1`.
- `FormBuilderCheckboxGroup` is the next widget of `FormBuilder`. `name` and `options` are required parameters. We can set here the initial value, built-in and custom validators as well. Here, we used custom validator to select at least one checkbox.
```dart
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
```
- `FormBuilderRadioGroup` also requires `name` and `optional` parameters. Custom validation is used here.
```dart
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
```
- `FormBuilderDateRangePicker` requires `name`, `firstFDate`, and `lastDate`. Custom validation is used to make `DateRange` necessary.
```dart
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
```
- `FormBuilderDateTimePicker` required `name`.
```dart
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
```
- `FormBuilderDropdown` requires `name` and `items`.
```dart
                  FormBuilderDropdown(
                    name: 'Gender',
                    items: genderOptions
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ),
                        )
                        .toList(),
                    initialValue: genderOptions.first,
                    decoration:
                        const InputDecoration(labelText: 'DropDown Menu'),
                  ),
```
- `FormBuilderRangeSlider` requires `name`, `min`, `max`.
```dart
                  FormBuilderRangeSlider(
                    name: 'Range Slider',
                    min: 0,
                    max: 100,
                    initialValue: const RangeValues(0, 0),
                  ),
```
- `FormBuilderRangeSlider` requires `name` and `title`. `initial value` is set to true.
```dart
                  FormBuilderSwitch(
                    name: 'Switch',
                    title: const Text(
                      'Accept terms & conditions',
                      style: TextStyle(fontSize: 25),
                    ),
                    initialValue: true,
                  ),
```
- `Reset` button uses `formKey.currentState?.reset();` to reset the form. It can also reset specific fields as mentioned in `Read` button code.
```dart
                  ElevatedButton(
                    onPressed: () {
                      // Reset form
                      formKey.currentState?.reset();
                      // Optional: unfocus keyboard
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text('Reset'),
                  ),
```
- `Read` button is multifunctional. It first saves the fields `formKey.currentState?.fields['TextField2']?.save();` and then can read their values `formKey.currentState?.fields['TextField2']?.value;`. It can also read the whole form by first saving the form. It shows result in snackbar.
```dart
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
```
- `Submit` button first checks the validation of all fields of form `final validationResult = formKey.currentState!.validate();`. If `validationResult` is `true`, then it save the form and prints the saved values in console.
```dart
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
```
- `FormBuilder` widget or `flutter_form_builder` package also has other separated packages as explained above. You can also play them with.