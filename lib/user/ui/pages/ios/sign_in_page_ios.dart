import 'package:flutter/cupertino.dart';

import '../../widgets/sing_in_widget.dart';

class SignInPageIos extends StatelessWidget {
  const SignInPageIos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: LoginWidget()),
      ]),
    );
  }
}
