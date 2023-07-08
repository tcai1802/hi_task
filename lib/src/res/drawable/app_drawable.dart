import 'package:hi_task/src/res/drawable/drawable.dart';

class AppDrawable extends Drawable {
  // Get images
  @override
  String get imgLogo => "${imageBasePath}logo_app.svg";

  @override
  String get imgGetStarted1 => "${imageBasePath}get_started_1.png";

  @override
  String get imgGetStarted2 => "${imageBasePath}get_started_2.png";

  @override
  String get imgGetStarted3 => "${imageBasePath}get_started_3.png";

  @override
  String get imgNoImage => "${imageBasePath}no_image.png";

  @override
  String get imgSuccessVerify => "${imageBasePath}success_verify.png";

  @override
  String get imgVerifyAccount => "${imageBasePath}verify_account.png";
  // Get Icons
  @override
  String get iconAdd => "${iconBasePath}ic_add.svg";

  @override
  String get iconEmail => "${iconBasePath}ic_mail.svg";

  @override
  String get iconLock => "${iconBasePath}ic_lock.svg";

  @override
  String get iconFacebook => "${iconBasePath}ic_facebook.svg";

  @override
  String get iconGithub => "${iconBasePath}ic_github.svg";

  @override
  String get iconGoogle => "${iconBasePath}ic_google.svg";

  @override
  String get iconPerson => "${iconBasePath}ic_person.svg";
}
