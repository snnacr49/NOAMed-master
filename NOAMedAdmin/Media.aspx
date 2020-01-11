<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Media.aspx.cs" Inherits="Media" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="App.js"></script>
    <dx:ASPxCallbackPanel ID="pnlBack" runat="server" ClientInstanceName="pnlBack" Width="100%" OnCallback="pnlBack_Callback">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <table class="dxeBinImgCPnlSys">
                    <tr>
                        <td>
                            <table class="dxeBinImgCPnlSys">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="dxeBinImgCPnlSys">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Facebook</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtface" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Twitter</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txttwitter" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Instagram</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtInsta" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Youtube</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtyoutube" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnsave" runat="server" AutoPostBack="False" Text="SAVE">
                                            <ClientSideEvents Click="function(s, e) {
	pnlBack.PerformCallback('Save');
}" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>

