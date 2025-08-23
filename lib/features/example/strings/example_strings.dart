import 'package:easy_localization/easy_localization.dart';

class ExampleStrings {
  static String get title => "example.title".tr();
  static String get createTitle => "example.create_title".tr();
  static String get updateTitle => "example.update_title".tr();

  static String get create => "example.create".tr();
  static String get update => "example.update".tr();

  // Fields
  static String get name => "example.name".tr();

  // Errors
  static String get idNotFound => "example.error.id_not_found".tr();
  static String get invalidId => "example.error.invalid_id".tr();

  // Actions
  static String get newButton => "example.new_button".tr();
  static String get editButton => "example.edit_button".tr();

  // Messages
  static String get createSuccess => "example.create_success";
  static String get updateSuccess => "example.update_success";
  static String get updateError => "example.update_error";
  static String get deleteSuccess => "example.delete_success";
  static String get notFound => "example.not_found".tr();
}
