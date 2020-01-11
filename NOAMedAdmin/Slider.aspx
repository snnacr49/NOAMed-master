<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Slider.aspx.cs" Inherits="Slider" %>

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
                                    <td style="width: 20px;">

                                         <dx:ASPxButton ID="btnsave" runat="server" AutoPostBack="False" Text="NEW RECORD">
                                            <ClientSideEvents Click="function(s, e) {
	showPopup('AddSlider.aspx','Add-Edit Slider',700,400);
}" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width: 100px;">
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Refresh List">
                                            <ClientSideEvents Click="function(s, e) {
	pnlBack.PerformCallback('Refresh');
}" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
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
                                    <dx:GridViewDataTextColumn Caption="ID" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="ID">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Title" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="Title">
                                    </dx:GridViewDataTextColumn>
                                    
                                      <dx:GridViewDataTextColumn Caption="Insert Date" ShowInCustomizationForm="True" VisibleIndex="4" FieldName="InsertDate">

                                      </dx:GridViewDataTextColumn>
                                 
                                   
                                    <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" ShowClearFilterButton="True">
                                        <CustomButtons>                                           
                                            <dx:GridViewCommandColumnCustomButton ID="btnRemove">
                                                <Image IconID="spreadsheet_removepivotfield_16x16" ToolTip="Remove Slider">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                           
                                            <dx:GridViewCommandColumnCustomButton ID="btnEditSlider">
                                                 <Image IconID="mail_editcontact_16x16" ToolTip="Edit Slider">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                           
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>
                                   
                                </Columns>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                                
                           
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>

