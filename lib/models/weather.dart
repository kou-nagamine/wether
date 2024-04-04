class Weatherforecast{
  final String? title;
  final String? telop;
  final String? maxCelsius;
  final String? minCelsius;

  //通常のコンストラクタを定義・初期化処理
  Weatherforecast({this.title, this.telop, this.maxCelsius, this.minCelsius});
  
  //factoryコンストラクタ
  //JSONをmodel型に変更処理し該当のデータを返す
  factory Weatherforecast.fromJson(Map<String,dynamic>camejson){
    return Weatherforecast(
      title: camejson["title"],  
      telop: camejson['forecasts'][1]["telop"],
      maxCelsius: camejson['forecasts'][1]["temperature"]["max"]["celsius"],
      minCelsius: camejson['forecasts'][1]["temperature"]["min"]["celsius"]
    );
  }
}