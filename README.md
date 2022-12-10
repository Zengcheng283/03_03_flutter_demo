# flutter_demo

How to run at Web like Chrome

```bash
python3 server/core.py 
```
if you see following words, which means the server is running.

```bash
* Serving Flask app 'core'
* Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
* Running on all addresses (0.0.0.0)
* Running on http://127.0.0.1:60000
* Running on http://192.168.xx.xx:60000
Press CTRL+C to quit
```

Then, print following in cmd

```bash
cd xxx/FilePath
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
flutter run -d chrome
```

you will see, and your chrome will open and you will see the application.

```bash
Launching lib/main.dart on Chrome in debug mode...
Waiting for connection from debug service on Chrome...              9.6s
This app is linked to the debug service: ws://127.0.0.1:63431/xxxx
Debug service listening on ws://127.0.0.1:63431/xxxx

💪 Running with sound null safety 💪

🔥  To hot restart changes while running, press "r" or "R".
For a more detailed help message, press "h". To quit, press "q".
```
