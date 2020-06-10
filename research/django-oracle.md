# Django and Oracle in Docker

## Setup oracle client
- Get sure you use the right versions on each command
[cx_oracle](https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html#installing-cx-oracle-on-linux)

- pip3 install cx_Oracle

## Connect Django to oracle

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.oracle',
        'NAME': 'ORCLCDB',
        'USER': 'hr',
        'PASSWORD': 'hr',
        'HOST': 'localhost',
        'PORT': '1521'
    }
}
```

