<%@page import="com.eazydeals.entities.Message"%>
<%
Message messg = (Message) session.getAttribute("message");
if (messg != null) {
%>
<div class="alert <%=messg.getCssClass()%>" role="alert" id="alert">
	<%=messg.getMessage()%>
</div>
<%
session.removeAttribute("message");
}
%>
<script type="text/javascript">
	setTimeout(function() {
		$('#alert').alert('close');
	}, 3000);
</script>