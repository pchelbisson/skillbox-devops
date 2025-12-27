Working with HTTP Cookies using curl
🎯 Goal

Practice sending HTTP requests to websites using the curl utility and understand how cookies are transferred in HTTP responses.

📌 Task Description

Send an HTTP request to the website http://ya.ru using curl.

Identify which cookies are returned in the response.

Capture the output of the curl command.

Highlight the relevant response lines that contain cookies.

🛠️ Solution Approach
Why headers matter

Cookies are not part of the response body (HTML). They are transferred via HTTP response headers.

Specifically, cookies are sent using the Set-Cookie header.

To see response headers, curl must be instructed to output them explicitly.

📤 HTTP Response Analysis

When requesting http://ya.ru, the server responds with multiple Set-Cookie headers.

Example (excerpt from response headers):

Set-Cookie: spravka=...; domain=.ya.ru; path=/; expires=Fri, 23 Jan 2026 13:13:21 GMT
Set-Cookie: yasc=...; domain=.ya.ru; path=/; expires=Sat, 22 Dec 2035 13:13:21 GMT; secure
Set-Cookie: bh=...; Domain=.ya.ru; Path=/; Expires=Thu, 28 Jan 2027 13:13:21 GMT

These lines were highlighted in the screenshot as the correct answer to the task.

🍪 Cookies Observed
Cookie Name	Purpose (High-level)
spravka	Internal service / infrastructure logic
yasc	Security and anti-abuse mechanisms
bh	Infrastructure-related cookie

All observed cookies are service cookies, not user-tracking or advertising cookies.

🧠 Key Learnings
1. Where cookies come from

Cookies are delivered via HTTP response headers using Set-Cookie.

A simple curl <url> request is not enough to see them — headers must be inspected.

2. Why cookies are sent immediately

Cookies may be set on the first request, even without authentication.

This is done for technical reasons such as:

infrastructure routing

anti-DDoS protection

client identification

session preparation

3. Cookies vs Security

Cookies do not provide security by themselves.

They are a state management mechanism.

A website can function without cookies, especially if it is static or stateless.

4. Why HTTPS is more important than cookies

HTTPS (TLS) ensures:

encrypted traffic

data integrity

server authentication

Cookies can only be considered secure when transmitted over HTTPS.

✅ Final Result

HTTP response headers were successfully inspected

All Set-Cookie headers were correctly identified

The task objective was fully achieved

📎 Notes

This exercise helped reinforce the distinction between:

application state (cookies)

transport security (HTTPS)

Both are important, but they solve different problems in web architecture.