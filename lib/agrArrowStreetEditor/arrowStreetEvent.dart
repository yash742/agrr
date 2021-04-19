abstract class ArrowStreetEditorEvent {}

//the ads/offer Text field
class AdsFieldChanged extends ArrowStreetEditorEvent {
  final String ads;
  AdsFieldChanged({this.ads});
}

//button to view the ad on canvas
class AdsSubmittedToCanvas extends ArrowStreetEditorEvent {}

//posting the ads to dataBase
class AdsGoButtonClicked extends ArrowStreetEditorEvent {}
