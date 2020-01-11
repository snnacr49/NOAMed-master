<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoucherList.aspx.cs" Inherits="VoucherList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="App.js"></script>
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
		alert('Process Is Successfull');

	}
if(typeof(s.cpError) !='undefined' &amp;&amp;  s.cpError !='')
	{
		s.cpError='';
		alert('This voucher is not avalible. Please check');
	}

}" />
                <PanelCollection>
<dx:PanelContent runat="server">
    <table class="dx-justification">
        <tr>
            <td>
                <dx:ASPxLabel ID="lblCustomerInfo" runat="server" Font-Bold="True" Text="Customer Info">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <table class="dxflInternalEditorTable_DevEx">
                    <tr>
                        <td>Total Voucher Input</td>
                        <td>Total Voucher Exit</td>
                        <td>Net Voucher Amount</td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxTextBox ID="txtTotalIn" runat="server" BackColor="#33CC33" Font-Bold="True" Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtTotalOut" runat="server" BackColor="#FFFFCC" Font-Bold="True" Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtNetTotal" runat="server" BackColor="#CCCCCC" Font-Bold="True" ForeColor="#FF5050" Width="100%">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" KeyFieldName="ID" Width="100%">
                    <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(s,e);
}" />
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
                        <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="VoucherNo" FieldName="VoucherNo" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="IsActive" FieldName="IsActive" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Insert User Name" FieldName="InsertUserName" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Insert Time" FieldName="InsertTime" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Delete User Name" FieldName="DeleteUserName" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Delete Time" FieldName="DeleteTime" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Used User Name" FieldName="UsedUserName" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Used Date time" FieldName="UsedDatetime" ShowInCustomizationForm="True" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Is Used ?" FieldName="IsUsed" ShowInCustomizationForm="True" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnApprove">
                                    <Image IconID="actions_apply_16x16" ToolTip="Use This Voucher">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnRemove">
                                    <Image IconID="spreadsheet_removepivotfield_16x16" ToolTip="Remove This Voucher">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Color" FieldName="Color" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
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
