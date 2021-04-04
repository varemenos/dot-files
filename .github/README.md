# dot-files (why the dash? idk)

## Installation instructions

```shell
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod a+x /usr/local/bin/yadm

yadm clone yadm clone --bootstrap git@github.com:varemenos/dot-files.git
```

## Bootstrap system

The bootstrapping part of this repo is triggered via yadm but it's content is custom-built.
The [bootstrap](/blob/master/.config/yadm/bootstrap) loads up a bunch of utility functions which then help load a set of thematically-separated scripts called modules (for the sake of not finding a better word for them). Each module then is in charge of running the scripts it's supposed to run and clean up after itself; they must even make sure they run only in the platforms that they are supposed to run (i.e. platform specific set-up).

## Structure

All files are located in the same way they'd be located in the target machine relative to the position of home `~`.
The ones files that are not related are the ones in .github which is an alternative way to store GitHub-related files such as LICENSE, README, CONTRIBUTING, and ISSUE_TEMPLATE.

## Future goals

* Make all modules idempotent
* Try to follow/enforce the XDG Base Directory spec if possible
* Support more platforms
* Make it possible for other people to use this without any issues
* Install dependencies as part of the bootstrapping
