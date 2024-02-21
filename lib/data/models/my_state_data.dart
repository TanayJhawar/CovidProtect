class MyStateData {
  String _state;
  String _stateCode;
  int _active;
  int _confirmed;
  int _deaths;
  int _recovered;
  int _todayConfirmed;
  int _todayRecovered;
  int _todayDeaths;
  int _todayActive;

  MyStateData({String state, String stateCode, String lastUpdatedTime, String stateNotes, int active, int confirmed, int deaths, int recovered, int todayConfirmed, int todayRecovered, int todayDeaths}) {
    this._state = state;
    this._stateCode = stateCode;
    this._todayRecovered = todayRecovered;
    this._active = active;
    this._confirmed = confirmed;
    this._deaths = deaths;
    this._recovered = recovered;
    this._todayConfirmed = todayConfirmed;

    this._todayDeaths = todayDeaths;
    this._todayActive = todayConfirmed - todayRecovered - todayDeaths;

  }

  factory MyStateData.fromJson(Map<String, dynamic> json) {
    return MyStateData(
      state: json["Province_State"],
      stateCode: json["Slug_State"],
      todayRecovered: json["NewRecovered"],
      confirmed: (json["Confirmed"]) ?? 0,
      recovered: (json["Recovered"]) ?? 0,
      deaths: (json["Deaths"]) ?? 0,
      active : (json["Active"]??0),
      todayConfirmed: (json["NewConfirmed"]) ?? 0,
      todayDeaths: (json["NewDeaths"]) ?? 0,

    );
  }


  factory MyStateData.fromDistrictJson(Map<String, dynamic> districtJson) {
    return MyStateData(
      state: districtJson["City"],


      active: districtJson["Active"],
      confirmed: districtJson["Confirmed"],
      recovered: districtJson["Recovered"],
      deaths: districtJson["Deaths"],
      todayConfirmed: districtJson["NewConfirmed"],
      todayRecovered: districtJson["NewRecovered"],
      todayDeaths: districtJson["NewDeaths"],
    );
  }

  set state(String state) => this._state = state;
  set stateCode(String stateCode) => this._stateCode = stateCode;

  set active(int active) => this._active = active;
  set confirmed(int confirmed) => this._confirmed = confirmed;
  set deaths(int deaths) => this._deaths = deaths;
  set recovered(int recovered) => this._recovered = recovered;
  set todayConfirmed(int todayConfirmed) => this._todayConfirmed = todayConfirmed;
  set todayRecovered(int todayRecovered) => this._todayRecovered = todayRecovered;

  set todayDeaths(int todayDeaths) => this._todayDeaths = todayDeaths;

  String get state => this._state;
  String get stateCode => this._stateCode;

  int get active => this._active;
  int get confirmed => this._confirmed;
  int get deaths => this._deaths;
  int get recovered => this._recovered;
  int get todayConfirmed => this._todayConfirmed;
  int get todayRecovered => this._todayRecovered;
  int get todayActive => this._todayActive;
  int get todayDeaths => this._todayDeaths;

  @override
  String toString() {
    String data = "state: " + _state + ", stateCode: " + _stateCode  + ", active: " + _active.toString() + ", confirmed:" + _confirmed.toString() + ", deaths: " + _deaths.toString() + ", recovered:" + _recovered.toString() + ", todayConfirmed:" + _todayConfirmed.toString() + ", todayDeaths: " + _todayDeaths.toString() + ", todayActive: " + _todayActive.toString() + ", todayRecovered: " + _todayRecovered.toString() ;

    return data;
  }
}

