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
    
        <asp:Label ID="Label1" runat="server" Font-Names="Trebuchet MS" Font-Size="XX-Large" ForeColor="#0066FF" Text="Please Log-In"></asp:Label>
    
    </div>
        <asp:Label ID="Label2" runat="server" Font-Names="Trebuchet MS" Font-Size="Large" style="z-index: 1; left: 10px; top: 70px; position: absolute" Text="Please Log-In"></asp:Label>
        <asp:Label ID="Label3" runat="server" Font-Names="Trebuchet MS" style="z-index: 1; left: 10px; top: 100px; position: absolute" Text="Username"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Names="Trebuchet MS" style="z-index: 1; left: 10px; top: 160px; position: absolute" Text="Password"></asp:Label>
        <asp:TextBox ID="UserTB" runat="server" style="z-index: 1; left: 10px; top: 125px; position: absolute" Placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="PassTB" runat="server" style="z-index: 1; left: 10px; top: 185px; position: absolute" TextMode="Password" Placeholder="Password"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 9px; top: 250px; position: absolute; width: 126px;" Text="Login!" OnClick="OnLogIn" />
		<asp:CheckBox Text="Keep me signed in" ID="Persistent" RunAt="server" style="z-index: 1; left: 9px; top: 215px; position: absolute; width: 140px;" />
		<asp:Label ID="ErrorLabel" runat="server" Font-Names="Trebuchet MS" Font-Size="Smaller" style="z-index: 1; left: 10px; top: 279px; position: absolute" Text=""></asp:Label>
	</form>
</body>
</html>

<script language="C#" runat="server">
	void OnLogIn (Object sender, EventArgs e)
	{
		ErrorLabel.Text = "";
		if (CustomAuthenticate (UserTB.Text, PassTB.Text)) {
          string url = FormsAuthentication.GetRedirectUrl
              (UserTB.Text, Persistent.Checked);

          FormsAuthentication.SetAuthCookie (UserTB.Text, Persistent.Checked);

        if (!Persistent.Checked) {
              HttpCookie cookie = Response.Cookies[FormsAuthentication.FormsCookieName];
              cookie.Expires = DateTime.Now + new TimeSpan (0, 0, 8, 8);
        }

          Response.Redirect (url);
		  
      }
      else
        ErrorLabel.Text = "Invalid login. Please try again.";
  }

  bool CustomAuthenticate (string username, string password)
  {
      MySqlConnection connection = new MySqlConnection
          ("server=db1.cs.uakron.edu;database=WP_ajh158;uid=ajh158;pwd=aTieLa6x");
      try {
          connection.Open ();

          StringBuilder builder = new StringBuilder ();
          builder.Append ("select count(*) from users " + "where username = \'");
          builder.Append (username);
          builder.Append ("\' and pwd = \'");
          builder.Append (password);
          builder.Append ("\';");

          MySqlCommand command = new MySqlCommand (builder.ToString (), connection);
		
		  Int64 count = (Int64) command.ExecuteScalar ();
		  return(count > 0);
      }
      catch (MySqlException) {
          return false;
      }
      finally {
          connection.Close ();
      }
  }
</script>