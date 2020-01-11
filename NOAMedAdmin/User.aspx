<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

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
                                    <td style="width: 100px;">
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Add New User">
                                            <ClientSideEvents Click="function(s, e) {
	showPopup('AddUser.aspx','Add-Edit User',500,240);
}" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Refresh List">
                                            <ClientSideEvents Click="function(s, e) {
	pnlBack.PerformCallback('Refresh');
}" />
                                        </dx:ASPxButton>
                                        <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" Modal="True" PopupAnimationType="Slide" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                                            <ContentCollection>
                                                <dx:PopupControlContentControl runat="server">
                                                </dx:PopupControlContentControl>
                                            </ContentCollection>
                                        </dx:ASPxPopupControl>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="ID" ClientInstanceName="grid">
                                <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(s,e);
}" />
                                <SettingsPopup>
                                    <HeaderFilter MinHeight="140px">
                                    </HeaderFilter>
                                </SettingsPopup>
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="User ID" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="ID">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Name" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="FirstName">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Surname" ShowInCustomizationForm="True" VisibleIndex="3" FieldName="LastName">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="User Name" ShowInCustomizationForm="True" VisibleIndex="4" FieldName="Username">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status" ShowInCustomizationForm="True" VisibleIndex="5" FieldName="StatusID" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                        <CustomButtons>
                                            <dx:GridViewCommandColumnCustomButton ID="btnEditUser">
                                                <Image IconID="mail_editcontact_16x16" ToolTip="Edit User">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                            <dx:GridViewCommandColumnCustomButton ID="btnRemove">
                                                <Image IconID="spreadsheet_removepivotfield_16x16" ToolTip="Remove User">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Color" Caption="Color" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>

