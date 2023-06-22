# Ubuntu Build

Create a password file:
```bash
cat << EOF > variables.auto.pkrvars.hcl
proxmox_url = "https://192.168.1.201:8006/api2/json"
password = "supersecret"
http_bind_address = "192.168.1.19"
EOF
```
> Note: `http_bind_address` is the IP address of the host running Packer.

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

Generate hash for password `ubuntu`:
```bash
sudo apt install whois
mkpasswd
```
