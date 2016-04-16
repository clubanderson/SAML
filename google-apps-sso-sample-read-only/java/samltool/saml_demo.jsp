<!--
Copyright (C) 2006 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.
-->

<%@page import="java.lang.String"%>
<%@page import="java.net.URLEncoder"%>

<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <link href="global/style.css" type="text/css" rel="stylesheet"/>
  <title>VRM SAML Solution - Test Tool</title>
</head>
<body>
  <img alt="myVRM" src="global/logo.png" border="0" height="59" width="143"/>
  <span class="t">
  VRM SAML Solution - Test Tool
  </span>
  
  <h1>Pre-Transaction Details</h1>
  <p>A user with the account <b>demouser@psosamldemo.net</b> is trying to log into the myVRM Communication Service Manager application.</p>

  <p>This application sends a SAML authentication requests to the <b>ProcessResponseServlet</b> at the partner site. It will also use the DSA public and private keys provided with the sample code package to digitally sign SAML responses.</p>
  <div style="padding:0px 20px">
  <p><div style="padding:6px 0px;border-top:solid 1px #3366cc;border-bottom:solid 1px #3366cc"><b>Step 1: User tries to reach myVRM CSM</b></div></p>
  <p>The SAML authentication process begins when a user, who has not already been authenticated, tries to reach the URL for the Communication Service Manager service. In this application, a user is trying to reach the URL <b>http://testpilot1.myvrm.com/</b>.</p>
  </div>

  <%
    String error = (String)request.getAttribute("keyError");
    if (error != null) {
  %>
      <font color="red"><b><%= error %>. File not updated.</b></font><p>
  <%
    }
  %>		
  <table width="100%" height="100%">
    <tr>
      <td>
        <iframe name="service_provider" src="./service_provider.jsp"
          width="100%" height="100%" frameborder="1"></iframe>
      </td>
      <td>
        <iframe name="identity_provider" src="./ProcessResponseServlet"
          width="100%" height="100%" frameborder="1"></iframe>
      </td>
    </tr>
  </table>
</body>
</html>
