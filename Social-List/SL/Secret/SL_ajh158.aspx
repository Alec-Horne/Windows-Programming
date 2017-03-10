<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 570px">
    <form id="form1" runat="server">
        <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Names="Arial Rounded MT Bold" Font-Size="XX-Large" ForeColor="#6666FF" Text="Social List"></asp:Label>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="z-index: 1; left: 330px; top: 64px; position: absolute; width: 142px" Text="Modify Record" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" style="z-index: 1; left: 484px; top: 64px; position: absolute; width: 142px" Text="Delete Record" />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" style="z-index: 1; left: 637px; top: 64px; position: absolute; width: 142px" Text="Help" />
		<p style="height: 310px">
            <asp:Button ID="Button1" runat="server" Text="View Available Records" OnClick="Button1_Click" style="z-index: 1; left: 11px; top: 64px; position: absolute; width: 153px;" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" style="z-index: 1; left: 10px; top: 111px; position: absolute; height: 126px; width: 990px" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand"> 
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Postal_Code" HeaderText="Postal Code" SortExpression="Postal Code" />
					<asp:TemplateField>
						<ItemTemplate>
							<asp:Label runat="server" ID="BirthLbl" Text='<%# bind("DOB") %>'></asp:Label>
						</ItemTemplate>
						<HeaderTemplate> DOB </HeaderTemplate>
					</asp:TemplateField>
					<asp:HyperLinkField HeaderText="PA3_Link"  DataNavigateUrlFields="PA3_Link" Text="Programming Assignment 3" DataNavigateUrlFormatString="http://{0}" />
                    <asp:HyperLinkField HeaderText="Facebook_Link"  DataNavigateUrlFields="Facebook_Link" Text="Facebook" DataNavigateUrlFormatString="http://{0}" />
                    <asp:HyperLinkField HeaderText="Twitter_Link"  DataNavigateUrlFields="Twitter_Link" Text="Twitter" DataNavigateUrlFormatString="http://{0}" />
					<asp:TemplateField>
						<ItemTemplate>
							<asp:Button ID="button" runat="server" CommandName="DOB" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="View DOB" />
						</ItemTemplate>
						<HeaderTemplate> View DOB </HeaderTemplate>						
					</asp:TemplateField>
				</Columns>
            </asp:GridView>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add New Record" Width="142px" style="z-index: 1; left: 176px; top: 64px; position: absolute; right: 540px;" />
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
<script language="C#" runat="server">
		
		string role;
		
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				GridView1.Visible = false;
				BindData();
			}
		}
		
		private void BindData() {
			//open a connection and select all entries to display in gridview
			String ConnectString = ConfigurationSettings.AppSettings["connectionString"];
			MySqlDataAdapter msda = new MySqlDataAdapter("select * from ajh158", ConnectString);
			DataSet ds = new DataSet();
			msda.Fill(ds, "ajh158");
			//bind the data to the gridview
			GridView1.DataSource = ds;
			GridView1.DataBind();
		}
		
		private string GetUserRole (string name)
		{
			MySqlConnection connection = new MySqlConnection
				("server=db1.cs.uakron.edu;database=WP_ajh158;uid=ajh158;pwd=aTieLa6x"); 

			try {
				connection.Open ();

				StringBuilder builder = new StringBuilder ();
				builder.Append ("select role from users " + "where username = \'");
				builder.Append (name);
				builder.Append ("\'");

				MySqlCommand command = new MySqlCommand (builder.ToString (), connection);

				object role = command.ExecuteScalar ();

				if (role is DBNull)
					return null;

				return (string) role;
			}
			catch (MySqlException) {
				return null;
			}
			finally {
				connection.Close ();
			}
		}
		
		protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "DOB")
			{
				if(GetUserRole(Context.User.Identity.Name).CompareTo("Family") == 0){
					// Retrieve the row index stored in the CommandArgument property.
					int index = Convert.ToInt32(e.CommandArgument);

					// Retrieve the row that contains the button from the Rows collection.
					GridViewRow row = GridView1.Rows[index];

					Label l = (Label)row.FindControl("BirthLbl");
					l.Visible = true;
				}
			}
		}
		
		protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)  
		{  
			//Checking the RowType of the Row  
			if(e.Row.RowType==DataControlRowType.DataRow)
			{  
				Label l = (Label)e.Row.FindControl("BirthLbl");
				l.Visible = false;
			}  
		}   

        protected void Button2_Click(object sender, EventArgs e)
        {
			Response.Redirect("AddRecord.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyRecord.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteRecord.aspx");
        }
		protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Help.aspx");
        }
</script>