# Passbolt Setup

# Setup

# Create initial User

```bash
docker compose \
    exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
    passbolt register_user \
    -u admin@passbolt.localhost \
    -f Admin \
    -l Admin \
    -r admin" -s /bin/sh www-data
```