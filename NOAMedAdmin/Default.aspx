<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>


<%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>

    <dx:ASPxCallbackPanel ID="pnlBack" runat="server" ClientInstanceName="pnlBack" Width="100%">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False">
        <Settings AutoFilterCondition="Contains" ShowFilterBar="Auto" ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
        <SettingsPopup>
            <HeaderFilter MinHeight="140px">
            </HeaderFilter>
        </SettingsPopup>
        <SettingsText Title="WEB SITE MESSAGE LIST" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Name" ShowInCustomizationForm="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Surname" ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Email" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Date" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Message" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Users" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles>
            <Header Font-Bold="True">
            </Header>
            <TitlePanel Font-Bold="True">
            </TitlePanel>
        </Styles>
    </dx:ASPxGridView>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxCallbackPanel>

</asp:Content>