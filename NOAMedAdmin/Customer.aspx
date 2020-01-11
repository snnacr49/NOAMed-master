<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" %>

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
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Add New Customer">
                                            <ClientSideEvents Click="function(s, e) {
	showPopup('AddCustomer.aspx','Add-Edit Customer',700,350);
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
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" SummariesIgnoreNullValues="True" />
                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                <SettingsPopup>
                                    <HeaderFilter MinHeight="140px">
                                    </HeaderFilter>
                                </SettingsPopup>
                                 <Toolbars>
            <dx:GridViewToolbar>
                <SettingsAdaptivity Enabled="true" EnableCollapseRootItemsToIcons="true" />
                <Items>
                    <dx:GridViewToolbarItem Command="ExportToPdf" />
                    <dx:GridViewToolbarItem Command="ExportToXls" />
                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                    <dx:GridViewToolbarItem Command="ExportToDocx" />
                    <dx:GridViewToolbarItem Command="ExportToRtf" />
                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Customer ID" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="ID">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Name" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="Name">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Surname" ShowInCustomizationForm="True" VisibleIndex="3" FieldName="Surname">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Shop Name" ShowInCustomizationForm="True" VisibleIndex="4" FieldName="ShopName">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Phone" ShowInCustomizationForm="True" VisibleIndex="5" FieldName="PhoneNo" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn Caption="AddressInfo" ShowInCustomizationForm="True" VisibleIndex="6" FieldName="AddressInfo">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Insert UserName" ShowInCustomizationForm="True" VisibleIndex="7" FieldName="InsertUserName">
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption="InsertTime" ShowInCustomizationForm="True" VisibleIndex="8" FieldName="InsertTime">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Delete UserName" ShowInCustomizationForm="True" VisibleIndex="9" FieldName="DeleteUserName">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DeleteTime" ShowInCustomizationForm="True" VisibleIndex="10" FieldName="DeleteTime">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" ShowClearFilterButton="True">
                                        <CustomButtons>
                                            <dx:GridViewCommandColumnCustomButton ID="btnEditCustomer">
                                                <Image IconID="mail_editcontact_16x16" ToolTip="Edit Customer">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                            <dx:GridViewCommandColumnCustomButton ID="btnRemove">
                                                <Image IconID="spreadsheet_removepivotfield_16x16" ToolTip="Remove Customer">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                            <dx:GridViewCommandColumnCustomButton ID="btnVoucher">
                                                <Image IconID="format_listnumbers_16x16" ToolTip="Voucher List">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                            <dx:GridViewCommandColumnCustomButton ID="btnVoucherAdd">
                                                <Image IconID="actions_add_16x16" ToolTip="Add Voucher">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Color" Caption="Color" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total In Voucher" FieldName="TotalIn" ShowInCustomizationForm="True" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total Out Voucher" FieldName="TotalOut" ShowInCustomizationForm="True" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Net Voucher Amount" FieldName="NetTotal" ShowInCustomizationForm="True" VisibleIndex="14">
                                        <CellStyle BackColor="#00CC99">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                                <GroupSummary>
                                <dx:ASPxSummaryItem FieldName="TotalIn" SummaryType="Sum" />
                                <dx:ASPxSummaryItem FieldName="TotalOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem FieldName="NetTotal" SummaryType="Sum" />
                            </GroupSummary>
                            <TotalSummary>
                                 <dx:ASPxSummaryItem FieldName="TotalIn" SummaryType="Sum" />
                                <dx:ASPxSummaryItem FieldName="TotalOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem FieldName="NetTotal" SummaryType="Sum" />
                            </TotalSummary>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>

