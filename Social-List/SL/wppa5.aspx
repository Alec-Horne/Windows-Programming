<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Names="Trebuchet MS" Font-Size="XX-Large" ForeColor="#0066FF" Text="Home"></asp:Label>
    
    </div>
        <asp:Label ID="Label5" runat="server" Font-Names="Trebuchet MS" Font-Size="Large" style="z-index: 1; left: 11px; top: 60px; position: absolute" Text="<u>Links:</u>"></asp:Label>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 11px; top: 93px; position: absolute" Text="Social List" OnClick="Button1_Click" />
    </form>
</body>
</html>

<script language="C#" runat="server">
    void Button1_Click (Object sender, EventArgs e)
    {
        Response.Redirect("Secret/SL_ajh158.aspx");
    }
</script>
