import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';

class TabItem extends StatelessWidget {
Sources sourses;
bool isSelected;
TabItem(this.sourses,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
      decoration:BoxDecoration(
        border: Border.all(color:Colors.green),
        borderRadius: BorderRadius.circular(20),
        color: isSelected?Colors.green:Colors.transparent,
      ),
      child: Text(sourses.name??"",style:Theme.of(context).textTheme.subtitle1?.copyWith( fontSize:16,
      color: isSelected?Colors.white:Colors.green)),
    );
  }
}
