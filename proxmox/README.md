# Ubuntu Build

Create a password file:
```bash
cat << EOF > variables.auto.pkrvars.hcl
proxmox_url = "https://192.168.1.201:8006/api2/json"
password = "supersecret"
EOF
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
