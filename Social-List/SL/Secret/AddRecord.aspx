<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 469px;
        }
    </style>
</head>
<body style="height: 462px">
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Names="Arial Rounded MT Bold" Font-Size="XX-Large" ForeColor="#6666FF" Text="Add New Record"></asp:Label>
    
    </div>
&nbsp;<asp:TextBox ID="NameTB" runat="server" style="z-index: 1; top: 81px; position: absolute; left: 124px"></asp:TextBox>
        <asp:TextBox ID="BirthTB" runat="server" style="z-index: 1; top: 228px; position: absolute; left: 124px"></asp:TextBox>
        <asp:TextBox ID="ProjectTB" runat="server" style="z-index: 1; top: 260px; position: absolute; width: 400px; left: 124px"></asp:TextBox>
        <asp:TextBox ID="FacebookTB" runat="server" style="z-index: 1; top: 291px; position: absolute; left: 124px; width: 400px"></asp:TextBox>
        <asp:TextBox ID="TwitterTB" runat="server" style="z-index: 1; top: 321px; position: absolute; left: 124px; width: 400px"></asp:TextBox>
        <asp:TextBox ID="AddressTB" runat="server" style="z-index: 1; top: 154px; position: absolute; width: 346px; left: 124px"></asp:TextBox>
        <asp:TextBox ID="PhoneTB" runat="server" style="z-index: 1; left: 124px; top: 117px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="CityTB" runat="server" style="z-index: 1; left: 124px; top: 192px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="StateTB" runat="server" style="z-index: 1; top: 193px; position: absolute; width: 33px; left: 322px"></asp:TextBox>
        <asp:TextBox ID="ZipTB" runat="server" style="z-index: 1; top: 193px; position: absolute; width: 70px; left: 441px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 49px; top: 79px; position: absolute; width: 98px; right: 1163px" Text="Full Name:"></asp:Label>
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 78px; top: 229px; position: absolute; width: 34px" Text="DOB:"></asp:Label>
        <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 52px; top: 263px; position: absolute; width: 100px" Text="PA3 Link:"></asp:Label>
        <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 18px; top: 291px; position: absolute; width: 130px; right: 680px" Text="Facebook Link:"></asp:Label>
        <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 36px; top: 321px; position: absolute; width: 120px" Text="Twitter Link:"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 84px; top: 192px; position: absolute" Text="City:"></asp:Label>
        <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 283px; top: 194px; position: absolute" Text="State:"></asp:Label>
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 375px; top: 193px; position: absolute" Text="Zip Code:"></asp:Label>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 62px; top: 118px; position: absolute; width: 91px" Text="Phone #:"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 61px; top: 156px; position: absolute; width: 86px" Text="Address:"></asp:Label>
        <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" style="z-index: 1; left: 40px; top: 360px; position: absolute; width: 148px" Text="Submit New Record" />
        <asp:Button ID="HomeButton" runat="server" OnClick="HomeButton_Click" style="z-index: 1; left: 201px; top: 360px; position: absolute; width: 148px" Text="Return Home" />
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="#FF3300" style="z-index: 1; left: 41px; top: 395px; position: absolute; width: 348px; height: 20px"></asp:Label>
    </form>
</body>
</html>
<script language="C#" runat="server">
		protected void Page_Load(object sender, EventArgs e)
        {
            ErrorLabel.Text = "";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
			if(NameTB.Text != "") {
				try {
					// Create a new Connection and SqlDataAdapter
					String ConnectString = ConfigurationSettings.AppSettings["connectionString"];
					MySqlConnection msc = new MySqlConnection(ConnectString);
					msc.Open();
					MySqlDataAdapter msda = new MySqlDataAdapter("select * from ajh158", msc);
					DataSet ds = new DataSet();
					DataRow myDataRow;
					
					//Create a sqlcommandbuilder to auto generate insert/update statements
					MySqlCommandBuilder mySqlCommandBuilder = new MySqlCommandBuilder(msda);
					msda.MissingSchemaAction = MissingSchemaAction.AddWithKey;
    
					msda.Fill(ds, "ajh158");
					
					//create a new row and add the data from user entry
					DataRow myDataRow1 = ds.Tables["ajh158"].NewRow();
					myDataRow1["Name"] = NameTB.Text;
					myDataRow1["Phone_Number"] = PhoneTB.Text;
					myDataRow1["Address"] = AddressTB.Text;
					myDataRow1["State"] = StateTB.Text;
					myDataRow1["City"] = CityTB.Text;
					myDataRow1["Postal_Code"] = ZipTB.Text;
					myDataRow1["DOB"] = BirthTB.Text;
					myDataRow1["PA3_Link"] = ProjectTB.Text;
					myDataRow1["Facebook_Link"] = FacebookTB.Text;
					myDataRow1["Twitter_Link"] = TwitterTB.Text;
					ds.Tables["ajh158"].Rows.Add(myDataRow1);
					msda.Update(ds, "ajh158");
					msc.Close();
					Response.Redirect("SL_ajh158.aspx");
				} catch (Exception) {
					ErrorLabel.Text = "Please enter valid data. Try again.";
				}
			}else{
				ErrorLabel.Text = "At minimum the 'Name' field must be filled out.";
			}
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("SL_ajh158.aspx");
        }
</script>