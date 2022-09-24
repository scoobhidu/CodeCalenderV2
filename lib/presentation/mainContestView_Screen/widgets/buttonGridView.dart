import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/contestButtons.dart';
import 'package:flutter/material.dart';

class ButtonGridView extends StatelessWidget {
  ButtonGridView({required this.contestButtons});

  List<ContestButton> contestButtons;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: contestButtons,
    );
  }
}
