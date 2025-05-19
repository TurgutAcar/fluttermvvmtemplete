import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplete/core/constants/enums/ap_theme_enum.dart';
import 'package:fluttermvvmtemplete/core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store{
  late BuildContext _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  @observable
  int number =0;
  @computed
  bool get isEven=>number%2==0;

  @action
  void incrementNumber()
  {
    number++;
  }
  void changeTheme(BuildContext context)
  {
    Provider.of<ThemeNotifier>(context,listen: false)
        .changeValue(AppThems.DARK);
  }
}