import 'package:flutter/cupertino.dart';
import 'package:platform_design/user/ui/widgets/user_form.dart';

class SignUpPageIos extends StatelessWidget {
  const SignUpPageIos({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child:
            CustomScrollView(slivers: [SliverToBoxAdapter(child: UserForm())]));
  }
}
