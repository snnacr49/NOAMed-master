<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Messages" %>

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
                                    <dx:GridViewDataTextColumn Caption="Message No" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="ID">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Name and Surname" ShowInCustomizationForm="True" VisibleIndex="3" FieldName="FullName">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Phone" ShowInCustomizationForm="True" VisibleIndex="4" FieldName="Telephone">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Email" ShowInCustomizationForm="True" VisibleIndex="5" FieldName="Email">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Message" ShowInCustomizationForm="True" VisibleIndex="7" FieldName="Message" Width="50%">
                                    </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn Caption="Insert Date" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="InsertDate">
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

