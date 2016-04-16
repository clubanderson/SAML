<%@ page import="util.RequestUtil" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.net.URLEncoder" %>

<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <link href="global/style.css" type="text/css" rel="stylesheet"/>
  <title>SAML-based Single Sign-On Service for myVRM's Communication Service Manager App for a Partner Domain - Test Tool</title>
</head>
<body>
  <%
    String samlRequest = request.getParameter("SAMLRequest");
    if (samlRequest == null) {
  %>
      <p><b>SAML Request was not provided</b></p>
  <%
    } else {			
      String error = (String) request.getAttribute("error");
      if (error != null) {
      %>
        <p><font color="red"><b><%= error %></b></font><p>
      <%
      }
      String issueInstant = (String) request.getAttribute("issueInstant");
      String providerName = (String) request.getAttribute("providerName");
      String acsURL = (String) request.getAttribute("acsURL");
      String relayState = (String) request.getAttribute("relayStateURL");
      %>
        <form name="IdentityProviderForm" action="ProcessResponseServlet" method="post">
        <input type="hidden" name="SAMLRequest" value="<%=samlRequest%>"/>
        <input type="hidden" name="RelayState" value="<%=relayState%>"/>
        <input type="hidden" name="returnPage" value="identity_provider2.jsp">
        <input type="hidden" name="samlAction" value="Generate SAML Response">


      <% 
      String samlResponse = (String) request.getAttribute("samlResponse");
      if (samlResponse != null) {
      %>
          <%-- This is a hidden form that POSTs the SAML response to the ACS.--%>
          <form name="acsForm" action="<%=acsURL%>" method="post" target="_blank">
            <div style="display: none">
            <textarea rows=10 cols=80 name="SAMLResponse"><%=samlResponse%> </textarea>
            <textarea rows=10 cols=80 name="RelayState"><%=relayState%></textarea>
            </div>
          </form>
      <%
      }
    }
  %>
</body>
</html>
