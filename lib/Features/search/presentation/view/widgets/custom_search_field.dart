import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<SearchCubit>(context).state;
    TextEditingController textEditingController = TextEditingController(
      text: state is SearchSuccess ? state.searchQuery : '',
    );

    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.white,
      style: Styles.textStyle18.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: IconButton(
          icon: Opacity(
            opacity: 0.8,
            child: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 26,
            ),
          ),
          onPressed: () {
            if (onSubmitted != null) {
              onSubmitted!(textEditingController.text);
            }
          },
        ),
        border: buildOutLineInputBorder(),
        enabledBorder: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelText: 'Search',
        labelStyle: Styles.textStyle18.copyWith(
          color: Colors.white,
        ),
      ),
      // onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}

OutlineInputBorder buildOutLineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.white),
  );
}
