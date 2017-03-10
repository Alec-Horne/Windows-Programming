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
    <div style="height: 615px">
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" style="z-index: 1; left: 15px; top: 67px; position: absolute" Text="Directions:"></asp:Label>
    
        <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Names="Arial Rounded MT Bold" Font-Size="XX-Large" ForeColor="#6666FF" Text="Delete Existing Record"></asp:Label>
    
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 16px; top: 90px; position: absolute; height: 24px" Text="Enter the name of the record you would like to delete below, then click the find record button."></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 14px; top: 112px; position: absolute" Text="Once the data is processed, view the record that you would like to delete then press the delete button."></asp:Label>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 15px; top: 134px; position: absolute" Text="This will commit the changes to the database."></asp:Label>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" style="z-index: 1; left: 13px; top: 181px; position: absolute" Text="Record Name: "></asp:Label>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 334px; top: 177px; position: absolute; width: 157px" Text="Find Record" OnClick="Button1_Click" />
        <asp:TextBox ID="RecordTB" runat="server" style="z-index: 1; left: 118px; top: 181px; position: absolute; width: 189px"></asp:TextBox>
        <asp:TextBox ID="NameTB" runat="server" style="z-index: 1; left: 118px; top: 283px; position: absolute; width: 189px"></asp:TextBox>
        <asp:TextBox ID="PhoneTB" runat="server" style="z-index: 1; left: 118px; top: 316px; position: absolute; width: 189px"></asp:TextBox>
        <asp:TextBox ID="AddressTB" runat="server" style="z-index: 1; left: 118px; top: 349px; position: absolute; width: 190px"></asp:TextBox>
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 40px; top: 283px; position: absolute" Text="Full Name:"></asp:Label>
        <asp:Label ID="Label14" runat="server" style="z-index: 1; left: 12px; top: 487px; position: absolute" Text="Facebook Link:"></asp:Label>
        <asp:Label ID="Label16" runat="server" style="z-index: 1; left: 31px; top: 521px; position: absolute; margin-top: 0px" Text="Twitter Link:"></asp:Label>
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 53px; top: 317px; position: absolute" Text="Phone #:"></asp:Label>
        <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 53px; top: 351px; position: absolute" Text="Address:"></asp:Label>
        <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 79px; top: 385px; position: absolute" Text="City:"></asp:Label>
        <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 298px; top: 385px; position: absolute" Text="State:"></asp:Label>
        <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 410px; top: 386px; position: absolute" Text="Zip Code:"></asp:Label>
        <asp:Label ID="Label12" runat="server" style="z-index: 1; left: 73px; top: 419px; position: absolute" Text="DOB:"></asp:Label>
        <asp:Label ID="Label13" runat="server" style="z-index: 1; left: 41px; top: 454px; position: absolute; right: 702px;" Text="PA3 Link:"></asp:Label>
    
        <asp:TextBox ID="TwitterTB" runat="server" style="z-index: 1; left: 118px; top: 520px; position: absolute; width: 350px"></asp:TextBox>
        <asp:TextBox ID="StateTB" runat="server" style="z-index: 1; left: 341px; top: 385px; position: absolute; width: 34px; right: 475px"></asp:TextBox>
        <asp:TextBox ID="BirthTB" runat="server" style="z-index: 1; left: 118px; top: 418px; position: absolute; width: 105px"></asp:TextBox>
        <asp:TextBox ID="CityTB" runat="server" style="z-index: 1; left: 118px; top: 384px; position: absolute; width: 150px"></asp:TextBox>
        <asp:TextBox ID="FacebookTB" runat="server" style="z-index: 1; left: 118px; top: 486px; position: absolute; width: 350px"></asp:TextBox>
        <asp:TextBox ID="ZipTB" runat="server" style="z-index: 1; left: 476px; top: 383px; position: absolute; width: 80px"></asp:TextBox>
        <asp:TextBox ID="ProjectTB" runat="server" style="z-index: 1; left: 118px; top: 453px; position: absolute; width: 350px"></asp:TextBox>
    
        <asp:Label ID="InfoLabel" runat="server" ForeColor="Red" style="z-index: 1; left: 43px; top: 232px; position: absolute; width: 312px"></asp:Label>
    
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" style="z-index: 1; left: 508px; top: 180px; position: absolute; width: 312px"></asp:Label>
        <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 26px; top: 557px; position: absolute; width: 123px" Text="Delete Record" OnClick="Button2_Click" />
    
        <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 165px; top: 557px; position: absolute; width: 123px" Text="Return Home" OnClick="Button3_Click" />
    
    </div>
    </form>
</body>
</html>
<script language="C#" runat="server">
		protected void Page_Load(object sender, EventArgs e)
        {
            InfoLabel.Text = "";
            ErrorLabel.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
			try{
				// Create a new Connection and SqlDataAdapter
				String ConnectString = ConfigurationSettings.AppSettings["connectionString"];
				MySqlDataAdapter msda = new MySqlDataAdapter("select * from ajh158", ConnectString);
				DataSet ds = new DataSet();
				DataRow myDataRow;
			
				//Create a sqlcommandbuilder to auto generate insert/update statements
				MySqlCommandBuilder mySqlCommandBuilder = new MySqlCommandBuilder(msda);
				msda.MissingSchemaAction = MissingSchemaAction.AddWithKey;
    
				msda.Fill(ds, "ajh158");
    
				DataRow myDataRow1 = ds.Tables["ajh158"].Rows.Find(RecordTB.Text);
				NameTB.Text = myDataRow1["Name"].ToString();
				PhoneTB.Text = myDataRow1["Phone_Number"].ToString();
				AddressTB.Text = myDataRow1["Address"].ToString();
				StateTB.Text = myDataRow1["State"].ToString();
				CityTB.Text = myDataRow1["City"].ToString();
				ZipTB.Text = myDataRow1["Postal_Code"].ToString();
				BirthTB.Text = myDataRow1["DOB"].ToString();
				ProjectTB.Text = myDataRow1["PA3_Link"].ToString();
				FacebookTB.Text = myDataRow1["Facebook_Link"].ToString();
				TwitterTB.Text = myDataRow1["Twitter_Link"].ToString();
				InfoLabel.Text = "Your request record is below.";
			} catch (Exception) {
                ErrorLabel.Text = "Please enter valid data. Try again.";
			}
		}

        protected void Button2_Click(object sender, EventArgs e)
        {
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
			
			//find the record and delete it
			ds.Tables["ajh158"].Rows.Find(RecordTB.Text).Delete();
			
			//update and close the connection
			msda.Update(ds, "ajh158");
			msc.Close();
            //return to homepage after modifying a record
            Response.Redirect("SL_ajh158.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("SL_ajh158.aspx");
        }
</script>