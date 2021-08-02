andrewrothstein.opam
=========
![Build Status](https://github.com/andrewrothstein/ansible-opam/actions/workflows/build.yml/badge.svg)

Installs the [OCaml Package Manager](https://opam.ocaml.org/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.opam
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
