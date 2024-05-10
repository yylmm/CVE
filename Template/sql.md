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

The potential injection point is located within the `laporan_filter` function in `Pengeluaran.php`. This function directly utilizes the `$dari` and `$sampai` variables to construct a database query without employing parameterized queries or proper data sanitization measures.

```

```

### Proof of Concept:

**Burp Request:**

```

```

```

```

**Screenshot**

