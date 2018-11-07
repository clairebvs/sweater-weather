# README

Sweater Weather is a weather application. 

After selecting a location (city and state) you will be able to find out what the current weather is for that location. 
You will also know the weather for the next few days and the hourly weather for the day.
A background image of the city you searched for will be displayed. 

You can create an account and then login/logout. 
This account creation will allow you to save your favorite location and see a listing of all your favorites location so you will not be able to say .... you did not know it was going to rain or snow !

Stack used : 
* Ruby            2.4.1 
* Ruby on Rails   5.1.6
* Postgresql 
* Figaro 
* Faraday

This application consumes three API : 
* Google Geocode API (retrieve latitude and longitude for a city and state);
* Dark Sky API (retrieve weather data (current, hourly, daily) for a specific location);
* Flickr API (retrieve a collection of images for a location). 

Initial Setup :

Clone this repository using the following command line : ```git clone https://github.com/clairebvs/sweater-weather.git ```

Then run: ```bundle install```
