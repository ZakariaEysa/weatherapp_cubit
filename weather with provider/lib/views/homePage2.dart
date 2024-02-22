import 'package:flutter/material.dart';


class  searchpage2 extends StatelessWidget {
  const searchpage2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Search page ")),
      body: Center(
        child: TextField(

          decoration: InputDecoration(border:OutlineInputBorder(),hintText: "enter city name ",labelText: "Search",suffixIcon: Icon(Icons.search) ),

          onSubmitted: (value)  async{

            Navigator.pop(context);


          },






        ),
      ),







    );
  }
}
