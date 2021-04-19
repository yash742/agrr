abstract class AgapeEvent {}

class UserNameChanged extends AgapeEvent {
  final String userName;
  UserNameChanged({this.userName});
}

class UserDescriptionChanged extends AgapeEvent {
  final String userDescription;
  UserDescriptionChanged({this.userDescription});
}

class UserNameEditClicked extends AgapeEvent {}

class ChangeAvatarClicked extends AgapeEvent {}

class OpenImagePicker extends AgapeEvent {
  final imageSource; //ImageSource
  OpenImagePicker({this.imageSource});
}

class ProvideImagePath extends AgapeEvent {
  final String avatarPath;
  ProvideImagePath({this.avatarPath});
}
