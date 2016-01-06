# fibaro-nefit-easy


This is some code that can be used to show your Nefit Easy status in your Fibaro home center 2.

A device which can run nefit easy http server(https://github.com/robertklep/nefit-easy-http-server) is needed to connect the Fibaro home center 2, I'm using my Qnap nas for this.

You can use the init script in this repository to run Nefit easy HTTP server on your qnap nas. Replace the environment variable in the init script with your own nefit easy credentials

Nodejs is needed for this. I wrote a little manual on how you can install the newest version and fix the insufficient space issue on a qnap nas. This can be found here http://christian-web.nl/sections.php?section=news&news=177

The port for the virtual device is: 3000 and the ip is your nas (local) nas ip, an icon is also included.