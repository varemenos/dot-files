# dot-files

## Installation instructions

```shell
# first install yadm
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod a+x /usr/local/bin/yadm

# then use yadm to download, install and bootstrap the dot-files
yadm clone --bootstrap git@github.com:varemenos/dot-files.git
```

## Bootstrap system

The bootstrapping part of this repo is triggered via yadm but the content of it is custom-made.

The [bootstrap](/.config/yadm/bootstrap) script loads up a bunch of [utility functions](https://github.com/varemenos/dot-files/blob/master/.config/yadm/bootstrap_utils) which then help load a set of thematically-organized scripts called modules (for the sake of not finding a better word for them).
Each module has the obligation to the scripts it's supposed to run and clean up after itself. They must even make sure they run only in the platforms that they are supposed to run (i.e. platform specific set-up) and that the result is idempotence.

## Structure

The dot-files in this repo are located in the exact location you'd expect them to end up in your filesystem in relation to the path of home `~`.

The only files that are not related are the ones inside .github, which is an alternative way to store GitHub-related files such as LICENSE, README, CONTRIBUTING, and ISSUE_TEMPLATE.

## Future goals

* Make sure all modules are idempotent
* Support more platforms
* Make it possible for other people to use this without any issues
* Install dependencies as part of the bootstrapping
* explore git-crypt
* alternative to git-crypt, provide a way to load the encrypted data from another source before decrypting (so the ecrypted file doesn't live in this public repo and is easily replaced by other users).
