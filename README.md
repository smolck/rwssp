# RWSSP - Read it. Write it. Sing it. Say it. Pray it.

Memorizing Scripture is not really hard, but it can be difficult
to keep track of the verses you have memorized, what steps to take
to memorize the verse, etc. RWSSP (app name subject to change)
is meant to make that process easy and even enjoyable, by guiding the
user through the memorization process and thus by helping him keep
track of said process.

RWSSP, as the above header indicates, stands for "Read it. Write it. Sing it.
Say it. Pray it." It's a method (not my own) of memorizing and internalizing Scripture.
The premise is that one chooses the verse he'd like to memorize, then reads it
several times, say ten. Next he writes it out the same amount of times, in this
case ten. Then he'd sing it several times, and say it (read it aloud) several
times as well. Lastly, he prays it believing to the Lord **once**. By the end
of this process, he should have the verse memorized and "internalized."

At the moment, this app is still what I would consider in early alpha stages,
meaning not usable. Most of the functionality is still not implemented at this
point, and several areas need work, like test coverage, fonts, colors, etc.

# App Design

I take no credit for this app's design; all credit goes to [Christopher Hagedon](https://github.com/Robotboy897).
This app wouldn't be possible without the incredible work he's doing and has put in!

# Running the App

In order for this app to run correctly, you'll first need a YouVersion api key
to put in `assets/secrets.json`. To get one of those, just go to [YouVersion's Developer Site](https://developers.youversion.com/),
create an account, and get an api key. Then put that api key in the `assets/secrets.json`
file (you'll need to create it) like this, replacing `<insert token here>` with your key:

```json
{
    "youversion_dev_token": "<insert token here>"
}
```

After doing that, you can connect a device (or run an emulator) and do `$ flutter run -d <deviceId>`
(or just `$ flutter run` if you have only a single physical device connected). The app should load
and you'll be good to go!
