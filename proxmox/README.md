# Ubuntu Build

Create a password file:
```bash
touch variables.auto.pkrvars.hcl
```

Install plugins:
```bash
packer init .
```

Build Image:
```bash
packer build .
```

Foramt files:
```bash
packer fmt .
```

