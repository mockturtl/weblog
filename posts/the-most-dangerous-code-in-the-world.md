---
title: '"The Most Dangerous Code in the World"'
date: '2012-11-21'
description:
tags: [culture shock, php, diff -> apply]

---
>_Our main conclusion is that SSL certiﬁcate validation is completely broken in many critical software applications and libraries._

(emphasis original)

> Vulnerable software includes Amazon's EC2 Java library and all cloud clients 
> based on it; 
> Amazon's and PayPal's merchant SDKs... 
> Chase mobile banking... 
> any Android app that uses Pusher API to manage real-time messaging (for 
> example, GitHub’s Gaug.es), clients of Apache ActiveMQ servers...  

&nbsp;

> Instant messenger clients such as Trillian and AIM do not validate 
> certiﬁcates correctly, either. 
> A man-in-the-middle attack on Trillian yields login credentials for all 
> Google (including Gmail), Yahoo!, and Windows Live services (including 
> SkyDrive).

&nbsp;

>For the most part, the actual SSL libraries used in these programs are correct. Yet, regardless of which well-known library the software relies on—whether JSSE, OpenSSL, GnuTLS, or CryptoAPI, used directly or wrapped into a data-transport library such as Apache HttpClient or cURL—it often ﬁnds a way to end up with broken or disabled SSL certiﬁcate validation.

Martin Georgiev, Subodh Iyengar, Suman Jana, Rishita Anubhai, Dan Boneh, Vitaly Shmatikov, "[The Most Dangerous Code in the World: Validating SSL Certificates in Non-Browser Software](http://www.cs.utexas.edu/~shmat/shmat_ccs12.pdf)," _Association for Computing Machinery Conference on Computer and Communications Security_, October 2012.

>For example, Amazon’s Flexible Payments Service PHP library attempts to enable hostname veriﬁcation by setting cURL’s `CURLOPT_SSL_VERIFYHOST` parameter to `true`. Unfortunately, the correct, default value of this parameter is 2 _[[ref](http://php.net/manual/en/function.curl-setopt.php) &ndash; ed.]_; setting it to `true` silently changes it to 1 and disables certiﬁcate validation.

It's [patched](http://comments.gmane.org/gmane.comp.php.devel/76531)*, but: 

>the state of adversarial testing appears to be exceptionally poor even for critical software such as mobile banking apps and merchant SDKs responsible for managing secure connections to payment processors.

[More](http://daniel.haxx.se/blog/2012/10/04/ssl-verification-still-often-disabled/).

\* The php binding; curl author Daniel Stenberg [declined](http://daniel.haxx.se/blog/2012/10/25/libcurl-claimed-to-be-dangerous/) to inform four grad students and two professors that C [doesn't](https://github.com/bagder/curl/blob/7d4ed0b10e66f5a4bf8d215be50acfa81f02a3dd/lib/setup_once.h#L280) _have_ true.
