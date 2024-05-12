## XXXXXXXXX

## File upload RCE () 

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

After submitting the `logo` / `favicon` files on the `/admin/general-setting` page, the program did not verify the file name and file content, resulting in a file upload vulnerability.

```php

```

### Proof of vulnerability:

Upload png, capture the packet, modify the file content to malicious code, and modify the file suffix to php

**Burp Request:**

```

```

```

```

**Screenshot:**
