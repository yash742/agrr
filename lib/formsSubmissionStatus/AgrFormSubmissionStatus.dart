abstract class AgrFormSubmissionStatus {
  const AgrFormSubmissionStatus();
}

class AgrInitialFormStatus extends AgrFormSubmissionStatus {
  const AgrInitialFormStatus();
}

class AgrFormSibmitting extends AgrFormSubmissionStatus {}

class AgrFormSucess extends AgrFormSubmissionStatus {}

class AgrFormFaild extends AgrFormSubmissionStatus {
  final Exception exception;
  AgrFormFaild({this.exception});
}
