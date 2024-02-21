class AusMyStateData {
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

  AusMyStateData({String state, String stateCode, int active, int confirmed, int deaths, int recovered, int todayConfirmed,int todayActive, int todayRecovered, int todayDeaths}) {
    this._state = state;
    this._stateCode = stateCode;
    this._todayRecovered = todayRecovered;
    this._active = active;
    this._confirmed = confirmed;
    this._deaths = deaths;
    this._recovered = recovered;
    this._todayConfirmed = todayConfirmed;

    this._todayDeaths = todayDeaths;
    this._todayActive = todayActive;

  }

  factory AusMyStateData.fromJson(Map<String, dynamic> json) {
    return AusMyStateData(
      state: json["region"]["province"],
      stateCode: json["region"]['province'],
      todayRecovered: json["recovered_diff"],
      confirmed: (json["confirmed"]) ?? 0,
      recovered: (json["recovered"]) ?? 0,
      deaths: (json["deaths"]) ?? 0,
      active : (json["active"]??0),
      todayConfirmed: (json["confirmed_diff"]) ?? 0,
      todayDeaths: (json["deaths_diff"]) ?? 0,
      todayActive: (json["active_diff"]) ?? 0,

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
  set todayActive(int todayActive) => this._todayDeaths = todayActive;

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

