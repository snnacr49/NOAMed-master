<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxCallbackPanel ID="pnlBack" runat="server" ClientInstanceName="pnlBack" OnCallback="pnlBack_Callback" Width="100%">
                <PanelCollection>
<dx:PanelContent runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 30%">&nbsp;</td>
            <td>
                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="LOGIN PANEL" ShowCollapseButton="True" Width="400px">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table class="auto-style1">
                                <tr>
                                    <td>User Name</td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxTextBox ID="txtUsername" runat="server" Width="200px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxTextBox ID="txtPass" runat="server" Width="200px" Password="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Captch</td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxCaptcha ID="captcha" runat="server">
                                        </dx:ASPxCaptcha>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="LOGIN">
                                            <ClientSideEvents Click="function(s, e) {
	pnlBack.PerformCallback('Login');
}" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="lblSonuc" runat="server" Font-Bold="True" Font-Size="12pt">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
    </form>
</body>
</html>
