<%@ Page Title="" Language="C#" MasterPageFile="~/ACMasterPage.master" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Account Activities</h1>
    <br />
    <asp:Label Text="Customer Name: " runat="server" />
    <asp:DropDownList ID="drpActivity" runat="server" OnSelectedIndexChanged="drpActivity_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Text="Select Customer ..." Value="0" />
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:Panel ID="activityTable" runat="server" Visible="false">

        <asp:Label Text="Checking Account Activities:" runat="server" />
        <asp:table ID="tblChecking" runat="server" Width="550px" CssClass="table">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                <asp:TableHeaderCell>Transaction Type</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:table>
        <br />
        
        <asp:Label Text="Saving Account Activities" runat="server" />
        <asp:table ID="tblSaving" runat="server" Width="550px" CssClass="table">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                <asp:TableHeaderCell>Transaction Type</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:table>

    </asp:Panel>

</asp:Content>

