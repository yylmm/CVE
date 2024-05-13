## XXXXXXXXXXXX

## SQL Injection on ``

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

The potential injection point is located in `manage_inv.php`. This file directly utilizes the `$id`  variables to construct a database query without employing parameterized queries or proper data sanitization measures.

```

```

### Proof of Concept:

**Burp Request:**

```

```

```
python sqlmap.py -r 1.txt --current-user --batch --dbms mysql
```

**Screenshot:**

