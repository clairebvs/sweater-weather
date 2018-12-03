INTRODUCTION : 

Sweater Weather is a weather application. 

After selecting a location (city and state) you will be able to find out what the current weather is for that location. 
You will also know the weather for the next few days and the hourly weather for the day.
A background image of the city you searched for will be displayed. 

You can create an account and then login/logout. 
This account creation will allow you to save your favorite location and see a listing of all your favorites location so you will not be able to say .... you did not know it was going to rain or snow !

STACK USED : 
* Ruby            2.4.1 
* Ruby on Rails   5.1.6
* Postgresql 
* Figaro 
* Faraday

This application consumes three API : 
* Google Geocode API (retrieve latitude and longitude for a city and state);
* Dark Sky API (retrieve weather data (current, hourly, daily) for a specific location);
* Flickr API (retrieve a collection of images for a location). 

INITIAL SETUP :

Clone this repository using the following command line : ```git clone https://github.com/clairebvs/sweater-weather.git ```

Then run: ```bundle install```

API ENDPOINT EXAMPLE : 

GET /api/v1/forecast
https://afternoon-anchorage-21038.herokuapp.com/api/v1/forecast?location=austin,tx

Response : 
``` ruby 
{
data: {
id: "{:city=>"Austin", :state=>"TX"}",
type: "forecast",
attributes: {
current_weather: {
time: 1543813428,
summary: "Clear",
icon: "clear-night",
nearestStormDistance: 102,
nearestStormBearing: 177,
precipIntensity: 0,
precipProbability: 0,
temperature: 51.49,
apparentTemperature: 51.49,
dewPoint: 39.11,
humidity: 0.62,
pressure: 1013.64,
windSpeed: 5.44,
windGust: 8.68,
windBearing: 27,
cloudCover: 0,
uvIndex: 0,
visibility: 10,
ozone: 253.4
}, 
``` 

GET /api/v1/backgrounds
https://afternoon-anchorage-21038.herokuapp.com/api/v1/backgrounds?location=austin,tx

Response : 
``` ruby 
{
data: {
id: "austin,tx",
type: "background_image",
attributes: {
city_image: {
city_id: "44428030521",
city_title: "9 Zilker Botanical Gardens: September",
city_url: "http://www.flickr.com/photos/53055958@N00/44428030521",
city_short_url: "http://flic.kr/p/2aFXgCe"
}
}
}
}
```




