<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Voucher.aspx.cs" Inherits="Voucher" %>

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
            <td class="auto-style1">Voucher Start Number</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtVoucherStartNumber" runat="server" Width="50%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Voucher Amount</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtVoucherAmount" runat="server" Width="50%" Text="1">
                    <MaskSettings Mask="&lt;0..1000&gt;" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
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
