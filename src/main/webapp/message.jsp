<%
    String m = (String) session.getAttribute("message");

    if (m != null) {
//        out.println(m);
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%=m%></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        session.removeAttribute("message");

    } else {
        out.println(" ");
    }

%>
