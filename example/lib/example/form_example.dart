import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/radio_button_example.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';

class FormExample extends StatefulWidget {
   const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Value groupValue = Value.one;
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  GSSizes selectedSizeOption = GSSizes.$md;
  bool isDisabled = false;
  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  bool isReadOnly = false;
  void updateIsReadOnly(bool value) {
    setState(() {
      isReadOnly = value;
    });
  }

  bool isInvalid = false;
  void updateIsInvalid(bool value) {
    setState(() {
      isInvalid = value;
    });
  }

  bool isRequired = false;
  void updateIsRequired(bool value) {
    setState(() {
      isRequired = value;
    });
  }

  static const sp = SizedBox(height: 4);
  static const sp2 = SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    var code = r"""GSFormControl(
          formKey: _formKey,
          size: selectedSizeOption,
          isRequired: isRequired,
          isInvalid: isInvalid,
          isReadOnly: isReadOnly,
          isDisabled: isDisabled,
          // autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 GSFormLabelText('Username'),
                sp,
                GSInput(
                  initialValue: "GlueStacky",
                  hintText: 'Enter your username here... | Ex. John Doe',
                  style: GSStyle(height: 70),
                ),
                sp2,
                 GSFormLabelText('Password'),
                sp,
                GSInput(
                  style: GSStyle(height: 80),
                  obscureText: true,
                  hintText: 'Enter you password here...',
                  validator: (input) {
                    if (input != null && (input as String).length < 8) {
                      return "Password must have atleast 8 characters!";
                    }
                    return null;
                  },
                ),
                //TEXTAREA---------------------
                 GSFormLabelText('Bio'),
                sp,
                 GSTextArea(
                  hintText: "Enter a bio describing yourself here....",
                ),
                 GSFormHelperText(
                    'Ex. Hey guys, I am ___ and I love doing ___'),

                sp2,
                //CHECKBOX------------------------
                 GSFormLabelText(
                  'Choose your hobbies',
                  isRequired: false,
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  GSCheckBoxIcon(),
                  ),
                  value: "Singing",
                  onChanged: (value) {},
                  label:  GSCheckBoxLabel(text: "Singing"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  GSCheckBoxIcon(),
                  ),
                  value: "Dancing",
                  onChanged: (value) {},
                  label:  GSCheckBoxLabel(text: "Dancing"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  GSCheckBoxIcon(),
                  ),
                  value: "Sports",
                  onChanged: (value) {},
                  label:  GSCheckBoxLabel(text: "Sports"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  GSCheckBoxIcon(),
                  ),
                  value: "Driving",
                  onChanged: (value) {},
                  label:  GSCheckBoxLabel(text: "Driving"),
                ),
                sp2,
                //RADIO---------------------------
                 GSFormLabelText('Choose a group', isRequired: false),
                sp,
                GSRadio<Value>(
                  value: Value.one,
                  groupValue: groupValue,
                  onChanged: (p0) {
                    setState(() {
                      groupValue = p0!;
                    });
                  },
                  icon:  GSRadioIcon<Value>(),
                  label:  GSRadioText<Value>(text: 'Capitalist'),
                  style: GSStyle(
                      margin:  EdgeInsets.only(right: $GSSpace.$2)),
                ),
                sp,
                GSRadio<Value>(
                  value: Value.four,
                  groupValue: groupValue,
                  onChanged: (p0) {
                    setState(() {
                      groupValue = p0!;
                    });
                  },
                  icon:  GSRadioIcon<Value>(),
                  label:  GSRadioText<Value>(text: 'Communist'),
                  style: GSStyle(
                      margin:  EdgeInsets.only(right: $GSSpace.$2)),
                ),
                sp2,
                sp2,
                GSButton(
                    action: GSActions.positive,
                    variant: GSVariants.outline,
                    child:  Text(
                      'Submit',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate() &&
                          !isDisabled) {
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            content: Text(
                              'Submitting data...',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),""";
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Form Control"),
      ),
      body: BaseLayout(
        code: code,
        component: GSFormControl(
          formKey: _formKey,
          size: selectedSizeOption,
          isRequired: isRequired,
          isInvalid: isInvalid,
          isReadOnly: isReadOnly,
          isDisabled: isDisabled,
          // autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 const GSFormLabelText('Username'),
                sp,
                const GSInput(
                  initialValue: "GlueStacky",
                  hintText: 'Enter your username here... | Ex. John Doe',
                  // style: GSStyle(height: 70),
                ),
                sp2,
                 const GSFormLabelText('Password'),
                sp,
                GSInput(
                  style: GSStyle(height: 80),
                  obscureText: true,
                  hintText: 'Enter you password here...',
                  validator: (input) {
                    if (input != null && (input as String).length < 8) {
                      return "Password must have atleast 8 characters!";
                    }
                    return null;
                  },
                ),
                //TEXTAREA---------------------
                 const GSFormLabelText('Bio'),
                sp,
                 const GSTextArea(
                  hintText: "Enter a bio describing yourself here....",
                ),
                 const GSFormHelperText(
                    'Ex. Hey guys, I am ___ and I love doing ___'),

                sp2,
                //CHECKBOX------------------------
                 const GSFormLabelText(
                  'Choose your hobbies',
                  isRequired: false,
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  const GSCheckBoxIcon(),
                  ),
                  value: "Singing",
                  onChanged: (value) {},
                  label:  const GSCheckBoxLabel(text: "Singing"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  const GSCheckBoxIcon(),
                  ),
                  value: "Dancing",
                  onChanged: (value) {},
                  label:  const GSCheckBoxLabel(text: "Dancing"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  const GSCheckBoxIcon(),
                  ),
                  value: "Sports",
                  onChanged: (value) {},
                  label:  const GSCheckBoxLabel(text: "Sports"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child:  const GSCheckBoxIcon(),
                  ),
                  value: "Driving",
                  onChanged: (value) {},
                  label:  const GSCheckBoxLabel(text: "Driving"),
                ),
                sp2,
                //RADIO---------------------------
                 const GSFormLabelText('Choose a group', isRequired: false),
                sp,
                GSRadio<Value>(
                  value: Value.one,
                  groupValue: groupValue,
                  onChanged: (p0) {
                    setState(() {
                      groupValue = p0!;
                    });
                  },
                  icon:  const GSRadioIcon<Value>(),
                  label:  const GSRadioText<Value>(text: 'Capitalist'),
                  style: GSStyle(
                      margin:  EdgeInsets.only(right: $GSSpace.$2)),
                ),
                sp,
                GSRadio<Value>(
                  value: Value.four,
                  groupValue: groupValue,
                  onChanged: (p0) {
                    setState(() {
                      groupValue = p0!;
                    });
                  },
                  icon:  const GSRadioIcon<Value>(),
                  label:  const GSRadioText<Value>(text: 'Communist'),
                  style: GSStyle(
                      margin:  EdgeInsets.only(right: $GSSpace.$2)),
                ),
                sp2,
                sp2,
                GSButton(
                    action: GSActions.positive,
                    variant: GSVariants.outline,
                    child:  const Text(
                      'Submit',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate() &&
                          !isDisabled) {
                        ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                            content: Text(
                              'Submitting data...',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "size",
              dropdownOptions: dropdownSizeOptions,
              selectedOption: selectedSizeOption,
              onChanged: updateSizeSelectedOption,
            ),
             const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
             const SizedBox(height: 20),
            CustomToggle(
              title: "isInvalid",
              value: isInvalid,
              onToggle: updateIsInvalid,
            ),
             const SizedBox(height: 20),
            CustomToggle(
              title: "isReadOnly",
              value: isReadOnly,
              onToggle: updateIsReadOnly,
            ),
             const SizedBox(height: 20),
            CustomToggle(
              title: "isRequired",
              value: isRequired,
              onToggle: updateIsRequired,
            ),
          ],
        ),
      ),
    );
  }
}
