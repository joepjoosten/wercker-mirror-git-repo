mirror-git-repo
===========================

Mirror git repo with remote repository


Example
--------

Set the required access-token for the origin repository, and mirror git location.

```
    - joepjoosten/mirror-git-repo:
        access-token: access_token
        mirror: https://github.com/exampleuser/mirrored
```

Tip
--------

Use access tokens to circumvent the ssh key problems for the mirror (e.g. https://access_token@github.com/exampleuser/mirrored)