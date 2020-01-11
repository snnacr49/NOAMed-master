<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddBlog.aspx.cs" Inherits="AddBlog" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 17px;
        }
    </style>
    
    <script>
        function OnFileUploadComplete(s, e) {

            lblImage.SetText(e.callbackData);
        }

    </script>
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
                                <td class="auto-style1">Title</td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxTextBox ID="txtTitle" runat="server" ClientInstanceName="txtTitle" Width="100%">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Short Content</td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxMemo ID="txtShortContent" runat="server" Height="71px" Width="100%">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td>Image</td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxUploadControl ID="Upload" runat="server" ShowUploadButton="True" OnFileUploadComplete="Upload_FileUploadComplete" AutoStartUpload="True" UploadMode="Auto">
                                        <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe,.gif">
                                        </ValidationSettings>
                                        <ClientSideEvents FileUploadComplete="OnFileUploadComplete" />
                                    </dx:ASPxUploadControl>
                                    <dx:ASPxLabel ID="lblImage" runat="server" ClientInstanceName="lblImage">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxImage ID="image" runat="server" ClientInstanceName="image" ShowLoadingImage="True">
                                    </dx:ASPxImage>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>Content</td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxHtmlEditor ID="htmlcontent" runat="server" Width="100%">
                                        <SettingsHtmlEditing>
                                            <PasteFiltering Attributes="class" />
                                        </SettingsHtmlEditing>
                                    </dx:ASPxHtmlEditor>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="SAVE">
                                        <ClientSideEvents Click="function(s, e) {
    
	if(txtTitle.GetText()=='')
	{
		alert('Please select title');
		return;
	}
               if(lblImage.GetText()=='')
               {
		alert('Please select image');
		return;
	}
	pnlBack.PerformCallback('Save:'+lblImage.GetText());
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
