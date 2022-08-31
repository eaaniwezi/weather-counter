# weather_counter

Мини техническое задание.

Дополнить стартовый counter app как показано на видео.

- State management можно использовать любой, но желательно Bloc.
- Минимальное значение счётчика 0, максимальное 10.
- Тёмная тема. Когда активна тёмная тема счётчик должен прибавлять или отнимать 2, а не 1.
- Запросить локацию и показать погоду, используя любой бесплатный сервис.
  На что будем обращать внимание:
- Чистый и понятный код.
- Структура приложения. Несмотря на то, что приложение маленькое, желательно взять на расчёт его будущий рост и организовать файлы по фичам или любым другим рекомендованным образом.
- Отсутствие логики в UI.

Бонус: реализовать анимацию смены темы как в приложении Telegram от руки, без использования сторонних библиотек.

Complement the starting counter app as shown in the video.

- You can use any State management, but preferably a Block.
- The minimum value of the counter is 0, the maximum is 10.
- Dark theme. When the dark theme is active, the counter should add or subtract 2, not 1.
- Request a location and show the weather using any free service.
  What we will pay attention to:
- Clean and understandable code.
- Application structure. Despite the fact that the application is small, it is advisable to take into account its future growth and organize files by features or in any other recommended way.
- Lack of logic in the UI.

Bonus: implement theme change animation as in the Telegram application by hand, without using third-party libraries.


Prepartory action; 
(Weather ApiKey) You will need to connect the app with an APIKEY; Visit "https://home.openweathermap.org/api_keys" to create/generate an apiKey. Afterwhich, go the WeatherRepo class: lib>repositories>weather_repo.dart and put in the generated APIKEY in the vairable apiKey, eg) static const apiKey = "xxxxxxxxxxxxxxxxxxxxxxxx"; After which, click to save and then....

(Geo Location ApiKey) You will need to connect the app with an APIKEY; Visit "https://positionstack.com/" to create/generate an apiKey. Afterwhich, go the GeolocatorRepo class: lib>repositories>geolocator_repo.dart and put in the generated APIKEY in the vairable apiKey, eg) static const apiKey = "xxxxxxxxxxxxxxxxxxxxxxxx"; After which, click to save and then type "flutter pub get" on the terminal to get packages.

How to launch the app; If you're new to flutter, visit "https://docs.flutter.dev/get-started/install/windows" for proper guide on how to setUp and launch a flutter app.

