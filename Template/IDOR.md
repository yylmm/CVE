## XXXXXXXXXXXX

## IDOR on ``

### Vendor Homepage:

```

```

### Version:

```
V1.0
```

### Tested on:

```
PHP, Apache, MySQL
```

### Credentials:

```

```

### Affected Page:

```
```

A vulnerability(IDOR) was discovered in the page `/index.php`. An attacker might be able to perform horizontal or vertical privilege escalation by altering the user to one with additional privileges while bypassing access controls.

```php

```

### Proof of Concept:

1. Log in to the platform using employee accounts.
2. Send a request to create an administrator account through the interface.
3. Log in to the administrator account.

**Burp Request:**

```

```

**Screenshot:**



