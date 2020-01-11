<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddQuestion.aspx.cs" Inherits="AddQuestion" %>

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
            <td class="auto-style1">Question</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtQuestion" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Answer</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxMemo ID="txtAnswer" runat="server" Height="71px" Width="100%">
                </dx:ASPxMemo>
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
