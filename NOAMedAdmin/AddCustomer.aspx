<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCustomer.aspx.cs" Inherits="AddCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 17px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxCallbackPanel ID="pnlBack" runat="server" ClientInstanceName="pnlBack" OnCallback="pnlBack_Callback" Width="100%">
                <ClientSideEvents EndCallback="function(s, e) {
	if(typeof(s.cpOK) !='undefined' &amp;&amp;  s.cpOK =='OK')
	{
			var parentwindow = window.parent;
			parentwindow.CloseWindow();

	}
}" />
                <PanelCollection>
<dx:PanelContent runat="server">
    <table class="dx-justification">
        <tr>
            <td>Name</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Surname</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtSurname" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Shop Name</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtShopName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Phone No</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtPhoneNo" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address No</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxMemo ID="txtAddress" runat="server" Height="71px" Width="100%">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="SAVE">
                    <ClientSideEvents Click="function(s, e) {
	pnlBack.PerformCallback('Save');
}" />
                </dx:ASPxButton>
                <dx:ASPxLabel ID="lblSonuc" runat="server" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
    </form>
</body>
</html>
