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
    <div style="height: 576px">
    
        <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Names="Arial Rounded MT Bold" Font-Size="XX-Large" ForeColor="#6666FF" Text="Help Me"></asp:Label>
    
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 18px; top: 107px; position: absolute; width: 703px;" Text="Q. How do I view the available records currently in the database?"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 18px; top: 303px; position: absolute; width: 731px;" Text="Q. How do I modify a record that is in the database?"></asp:Label>
        <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 18px; top: 326px; position: absolute; width: 762px;" Text="A. From the homepage, click the button that says &quot;Modify Record&quot;. This will take you to a page that allows you to search for a record by name. After selecting a record, the information will show up below. Simply change whichever fields you would like then click the &quot;Update&quot; button to commit your changes to the database."></asp:Label>
        <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 18px; top: 248px; position: absolute; width: 760px;" Text="A. From the homepage, click the button that says &quot;Add Record&quot;. This will take you to a page that allows you to fill out all the data. After your done, hit the &quot;Submit New Record&quot; button to add your record."></asp:Label>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 18px; top: 166px; position: absolute; width: 707px;" Text="Q. How do I delete a record from the database?"></asp:Label>
        <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 18px; top: 130px; position: absolute; width: 704px;" Text="A. From the homepage, click the button that says &quot;View Avaiable Records&quot;"></asp:Label>
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 18px; top: 225px; position: absolute; width: 743px;" Text="Q. How do I add a record to the database?"></asp:Label>
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 18px; top: 189px; position: absolute; width: 746px;" Text="A. After clicking the &quot;Delete Record&quot; button, follow the directions on the redirect page."></asp:Label>
    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 22px; top: 406px; position: absolute; width: 157px" Text="Return Home" />
    
    </div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" style="z-index: 1; left: 10px; top: 69px; position: absolute" Text="Frequently Asked Questions:"></asp:Label>
    </form>
</body>
</html>
<script language="C#" runat="server">
		protected void Page_Load(object sender, EventArgs e)
        {
    
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("SL_ajh158.aspx");
        }
</script>