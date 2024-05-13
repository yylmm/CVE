## XXXXXXXXX

## Local File Inclusion ()

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

A vulnerability was discovered in the page `/index.php`. An authenticated user has the capability to access and read PHP files from the operating system by exploiting a Local File Inclusion (LFI) vulnerability through the wrapper filter.

```

```

### Proof of Concept:

**Payload：**

```
php://filter/convert.base64-encode/resource=index
```

**Burp Request：**

```

```

**Screenshot：**





