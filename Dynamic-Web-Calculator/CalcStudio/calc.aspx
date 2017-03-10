<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calc.aspx.cs" Inherits="wp_p3.calc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 511px;
            width: 656px;
        }
    </style>
</head>
<body style="height: 521px; width: 691px;">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#0000CC" Text="Calculator"></asp:Label>
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 8px; top: 48px; position: absolute; height: 408px; width: 298px; margin-top: 4px">
            <asp:CheckBox ID="CheckBox6" runat="server" style="z-index: 1; left: 265px; top: 275px; position: absolute; width: 62px; height: 20px" />
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 5px; top: 5px; position: absolute; width: 280px; margin-bottom: 0px" Font-Size="Medium"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 5px; top: 35px; position: absolute; width: 280px;" Font-Size="Medium"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 5px; top: 65px; position: absolute; width: 240px;" Font-Size="Smaller"></asp:TextBox>
            <asp:CheckBox ID="CheckBox8" runat="server" style="z-index: 1; left: 265px; top: 335px; position: absolute; width: 20px; height: 20px" />
            <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 5px; top: 95px; position: absolute; width: 240px;"></asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server" style="z-index: 1; left: 5px; top: 125px; position: absolute; width: 240px;"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server" style="z-index: 1; left: 5px; top: 155px; position: absolute; width: 240px;"></asp:TextBox>
            <asp:TextBox ID="TextBox7" runat="server" style="z-index: 1; left: 5px; top: 185px; position: absolute; width: 280px;" Font-Size="Medium"></asp:TextBox>
            <asp:TextBox ID="TextBox8" runat="server" style="z-index: 1; left: 5px; top: 215px; position: absolute; width: 280px;" Font-Size="Medium"></asp:TextBox>
            <asp:TextBox ID="TextBox9" runat="server" style="z-index: 1; left: 5px; top: 245px; position: absolute;  width: 240px;"></asp:TextBox>
            <asp:TextBox ID="TextBox10" runat="server" style="z-index: 1; left: 5px; top: 275px; position: absolute; width: 240px;"></asp:TextBox>
            <asp:TextBox ID="TextBox11" runat="server" style="z-index: 1; left: 5px; top: 305px; position: absolute; width: 240px;"></asp:TextBox>
            <asp:TextBox ID="TextBox12" runat="server" style="z-index: 1; left: 5px; top: 335px; position: absolute; width: 240px;"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 80px; top: 365px; position: absolute; width: 127px; height: 29px;" Text="Create Calculator" Font-Bold="True" CausesValidation="False"/>
            <asp:CheckBox ID="CheckBox1" runat="server" style="z-index: 1; left: 265px; top: 65px; position: absolute; width: 20px; height: 20px" />
            <asp:CheckBox ID="CheckBox4" runat="server" style="z-index: 1; left: 265px; top: 155px; position: absolute; width: 20px; height: 20px" />
            <asp:CheckBox ID="CheckBox5" runat="server" style="z-index: 1; left: 265px; top: 245px; position: absolute; width: 43px; height: 20px" />
            <asp:CheckBox ID="CheckBox7" runat="server" style="z-index: 1; left: 265px; top: 305px; position: absolute; width: 20px; height: 20px" />  
            <asp:CheckBox ID="CheckBox2" runat="server" style="z-index: 1; left: 265px; top: 95px; position: absolute; width: 20px; height: 20px" />
            <asp:CheckBox ID="CheckBox3" runat="server" style="z-index: 1; left: 265px; top: 125px; position: absolute; width: 20px; height: 20px" />
        </asp:Panel>  

        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 314px; top: 48px; position: absolute; height: 408px; width: 298px; margin-top: 4px">
            <asp:Label ID="ccLabel5" runat="server" style="z-index: 1; left: 9px; top: 314px; position: absolute" Text="R:"></asp:Label>
            <asp:Label ID="scLabel" runat="server" style="z-index: 1; left: 9px; top: 5px; position: absolute" Text="Simple Calculator" Font-Names="Arial" Font-Size="Large"></asp:Label>
            <asp:Label ID="ccLabel" runat="server" Font-Names="Arial" Font-Size="Large" style="z-index: 1; left: 8px; top: 184px; position: absolute" Text="Complex Calculator"></asp:Label>
            <asp:Button ID="scAddButton" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 9px; top: 30px; position: absolute; width: 30px; height: 30px" Text="+" OnClick="scAddButton_Click" />
            <asp:TextBox ID="scTextBox1" runat="server" style="z-index: 1; left: 83px; top: 68px; position: absolute"></asp:TextBox>
            <asp:Button ID="scSubtractButton" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 44px; top: 30px; position: absolute; width: 30px; height: 30px" Text="-" OnClick="scSubtractButton_Click" />
            <asp:Button ID="scMultiplyButton" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 79px; top: 30px; position: absolute; width: 30px; height: 30px" Text="*" OnClick="scMultiplyButton_Click" />
            <asp:Button ID="scDivideButton" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 114px; top: 30px; position: absolute; width: 30px; height: 30px" Text="/" OnClick="scDivideButton_Click" />
            <asp:Button ID="ccAddButton" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 9px; top: 209px; position: absolute; width: 30px; height: 30px" Text="+" OnClick="ccAddButton_Click" />
            <asp:Button ID="ccSubtractButton" runat="server" CausesValidation="False" style="z-index: 1; left: 44px; top: 209px; position: absolute; width: 30px; height: 30px;" Text="-" Font-Bold="True" Font-Size="Large" OnClick="ccSubtractButton_Click" />
            <asp:Button ID="ccMultiplyButton" runat="server" CausesValidation="False" style="z-index: 1; left: 79px; top: 209px; position: absolute; width: 30px; height: 30px;" Text="*" Font-Bold="True" Font-Size="Large" OnClick="ccMultiplyButton_Click" />
            <asp:Button ID="ccDivideButton" runat="server" CausesValidation="False" style="z-index: 1; left: 114px; top: 209px; position: absolute; width: 30px; height: 30px;" Text="/" Font-Bold="True" Font-Size="Large" OnClick="ccDivideButton_Click" />
            <asp:Label ID="ccLabel3" runat="server" style="z-index: 1; left: 122px; top: 268px; position: absolute; width: 13px;" Text="I:"></asp:Label>
            <asp:Label ID="scLabel1" runat="server" style="z-index: 1; left: 9px; top: 68px; position: absolute" Text="Number 1:"></asp:Label>
            <asp:Label ID="scLabel2" runat="server" style="z-index: 1; left: 9px; top: 98px; position: absolute" Text="Number 2:"></asp:Label>
            <asp:TextBox ID="scTextBox2" runat="server" style="z-index: 1; left: 83px; top: 98px; position: absolute"></asp:TextBox>
            <asp:TextBox ID="ccTextBox1" runat="server" style="z-index: 1; left: 26px; top: 268px; position: absolute; width: 58px; right: 201px"></asp:TextBox>
            <asp:Label ID="ccLabel1" runat="server" style="z-index: 1; left: 9px; top: 247px; position: absolute" Text="Complex 1:"></asp:Label>
            <asp:Label ID="ccLabel4" runat="server" style="z-index: 1; left: 9px; top: 293px; position: absolute" Text="Complex 2:"></asp:Label>
            <asp:Label ID="ccLabel2" runat="server" style="z-index: 1; left: 9px; top: 268px; position: absolute; width: 13px" Text="R:"></asp:Label>
            <asp:TextBox ID="ccTextBox2" runat="server" style="z-index: 1; left: 139px; top: 268px; position: absolute; width: 58px"></asp:TextBox>
            <asp:TextBox ID="ccTextBox3" runat="server" style="z-index: 1; left: 26px; top: 314px; position: absolute; width: 58px"></asp:TextBox>
            <asp:Label ID="ccLabel6" runat="server" style="z-index: 1; left: 122px; top: 314px; position: absolute; width: 13px;" Text="I:"></asp:Label>
            <asp:TextBox ID="ccTextBox4" runat="server" style="z-index: 1; left: 139px; top: 314px; position: absolute; width: 58px"></asp:TextBox>
            <asp:Label ID="scAnswerLabel" runat="server" ForeColor="Red" style="z-index: 1; left: 10px; top: 125px; position: absolute; width: 250px" Text="The answer is " Font-Size="Large"></asp:Label>
            <asp:Label ID="ccAnswerLabel" runat="server" ForeColor="Red" style="z-index: 1; left: 10px; top: 342px; position: absolute; width: 250px" Text="The answer is " Font-Size="Large"></asp:Label>
        </asp:Panel>
        <asp:Label ID="dirLabel1" runat="server" style="z-index: 1; left: 10px; top: 464px; position: absolute" Text="DIRECTIONS:" Font-Bold="True"></asp:Label>
        <asp:Label ID="dirLabel2" runat="server" style="z-index: 1; left: 10px; top: 483px; position: absolute" Text="Select the desired methods by checking each checkbox then click" Font-Bold="True"></asp:Label>
        <asp:Label ID="dirLabel3" runat="server" style="z-index: 1; left: 10px; top: 502px; position: absolute" Text="the &quot;Create Calculator&quot; button to create your dynamic calculator." Font-Bold="True"></asp:Label>
    </form>
</body>
</html>
