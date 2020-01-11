<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPage.aspx.cs" Inherits="AddPage" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="jquery.min.js"></script>
    <script src="jquery.friendurl.js"></script>
    <script>

        $('#Title').friendurl({ id: 'UrlLink', divider: '_', transliterate: true });
        function filesClone(id) {
            var c = $("[data-id=" + id + "]").clone();
            c.select();
            document.execCommand("copy");
        }

    </script>
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
            <td class="auto-style1">Parent</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxComboBox ID="comboparnt" runat="server" Width="100%">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                Name</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txtname" runat="server" Width="100%" ClientInstanceName="txtname">
                </dx:ASPxTextBox>
                 <input type="hidden" id="UrlLink" name="UrlLink" value="" />
            </td>

           
        </tr>
        <tr>
            <td>Content</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxHtmlEditor ID="htmlcontent" runat="server" Width="100%">
                    <settingshtmlediting>
                        <pastefiltering attributes="class" />
                    </settingshtmlediting>
                </dx:ASPxHtmlEditor>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="SAVE">
                    <ClientSideEvents Click="function(s, e) {
	//alert(document.getElementById('UrlLink').value);
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
