import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: TextFormField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.location_on_outlined),
            hintText: "Set Your Destination & Get 2x Bouns"),
      ),
    );
  }
}
