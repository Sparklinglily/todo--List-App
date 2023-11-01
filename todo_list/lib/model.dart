import 'package:flutter/material.dart';

class CvInfo {
  ValueNotifier<String> fullname = ValueNotifier("");
  ValueNotifier<String> email = ValueNotifier("");
  ValueNotifier<String> twitterHandle = ValueNotifier("");
  ValueNotifier<String> gitHubHandle = ValueNotifier("");
  ValueNotifier<String> slackName = ValueNotifier("");

  CvInfo({
    required String intialFullName,
    required String initialEmail,
    required String initialTwitterHandle,
    required String initialGitHubHandle,
    required String initialSlackName,
  }) {
    fullname.value = intialFullName;
    email.value = initialEmail;
    twitterHandle.value = initialTwitterHandle;
    gitHubHandle.value = initialGitHubHandle;
    slackName.value = initialSlackName;
  }
}
