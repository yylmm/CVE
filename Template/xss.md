## XXXXXXXXXXXXXX

## XSS on ``

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

The parameter `new_client` is being echoed directly into the HTML without proper sanitization or validation. This allows an attacker to inject arbitrary JavaScript code into the page, leading to XSS attacks.

### Proof of Concept:

**Payload:**

```
<svg/onload=alert``>
```

**Burp Request:**

```

```

**Screenshot:**
