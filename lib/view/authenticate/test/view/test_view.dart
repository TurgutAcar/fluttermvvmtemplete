import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplete/core/base/state/base_state.dart';
import 'package:fluttermvvmtemplete/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplete/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplete/core/init/lang/language_manager.dart';
import 'package:fluttermvvmtemplete/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplete/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  BaseState<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel? viewModel;
  @override
  Widget build(BuildContext context) {
    return  BaseView<TestViewModel>(onPageBuilder: (context,value)=>scaffoldBody,
        viewModel: TestViewModel(),onModelReady: (model){
          viewModel=model;
          viewModel!.setContext(context);
      },);

  }
  Widget get scaffoldBody=>Scaffold(
    appBar: AppBar(
      title: Text(LocaleKeys.welcome.locale),
      actions: [
        IconButton(onPressed: (){
          context.locale=LanguageManager.instance!.enLocale;
        }, icon: Icon(Icons.change_history))
      ],
    ),
    floatingActionButton: floatingActionButtonNumberIncrement,
    body: textNumber,
  );
  FloatingActionButton get floatingActionButtonNumberIncrement{
    return FloatingActionButton(onPressed: ()=>viewModel?.changeTheme(context));
  }
  Widget get textNumber{
    return Observer(builder:(context)=>Center(child: Text(viewModel!.number.toString())));
  }
}
