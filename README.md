# sunlibrate

This application should allow you to synchronize your daily routine with the sun phases.

IDEA:
The idea is to manage your time by adding events in regards to sunrises and sunsets in the particular area you are currently in.
An example event the user might add could be - "name: Wake up; sun phase: 20 min before sunrise; repeat: daily". The events in a
complete version should notify the user at the specified time.

DESIGN:
In its current design, the application divides the screen into two parts. The left part is darker, the sun image used is black and if
the sun is in the left-hand side of the screen this would mean that it is currently nighttime (after sunset and before sunrise). The
right part of the screen is brighter and the sun image used is yellow. If the sun is in the right-hand side of the screen this would mean
that it is daytime (after sunrise and before sunset). As regards to the vertical position of the sun image, I am using the ratio
"time remaining to sunrise/sunset : total time of set_to_rise/rise_to_set". With this logic, I am moving the sun from the top to the
bottom (from sunset to sunrise) on the left-hand side of the screen during the nighttime, and from the bottom to the top (from sunrise to
sunset) of the right-hand side of the screen during the day. The events illustrated by the calendar are positioned using the same logic.

CURRENT VERSION:
I have hardcoded a simple example of my idea. The example is using real data for the duration of the night and the day in the given
location and date. You can observe that, if you change the "p" value of the SunData in _getMock method, the sun position will change
accordingly. Negative values are used to indicate nighttime.

NOTES ON RUNNIG THE APP:
The application was developed and tested only on Android devices.

NOTES ON LICENSING:
MIT License (MIT)