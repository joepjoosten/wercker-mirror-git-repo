mirror-git-repo
===========================

Mirror git repo with remote repository


Example
--------

Set the required origin and mirror git location.
This step will use the step cache for faster incremental mirroring.

```
    - joepjoosten/mirror-git-repo:
        origin: https://github.com/exampleuser/repository-to-mirror.git
        mirror: https://github.com/exampleuser/mirrored
```