<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

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
                                    <td>Name</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtName" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Address</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtAddress" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Phone</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txttel" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Fax</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtfax" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Email</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtEmail" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Lat</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtLat" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Long</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtlong" runat="server" Width="400px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
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
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>

