<%@ Page Title="" Language="C#" MasterPageFile="~/ACMasterPage.master" AutoEventWireup="true" CodeFile="Withdraw.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Withdraw Fund</h1>
    <br />
    <div class="container no-padding">
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Customer Name:" runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:DropDownList runat="server" ID="drpWithdraw" AutoPostBack="true" OnSelectedIndexChanged="drpWithdraw_SelectedIndexChanged">
                    <asp:ListItem Text="Select Customer ..." Value="0" />
                </asp:DropDownList>
            </div>
            <div class="col-sm-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="drpWithdraw" CssClass="error" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Checking Account Balance: " runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:Label ID="lblCB" Text="" runat="server" />
            </div>
        </div><div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Saving Account Balance: " runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:Label ID="lblSB" Text="" runat="server" />
            </div>
        </div>
        <br />
        <br />
        <asp:RadioButton ID="checking" GroupName="account" Text="From Checking Account" Checked="true" AutoPostBack="true" OnCheckedChanged="checking_CheckedChanged" runat="server" />
        <br />
        <asp:RadioButton ID="saving" GroupName="account" Text="From Saving Account" AutoPostBack="true" OnCheckedChanged="saving_CheckedChanged" runat="server" />

        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Withdraw Amount: " runat="server" />
            </div>
            <div class="col-sm-1">
                <asp:TextBox Width="60px" ID="txtWithdrawAmt" runat="server" ControlToValidate="txtWithdrawAmt" AutoPostBack="false" />
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Required!" CssClass="error" ControlToValidate="txtWithdrawAmt"></asp:RequiredFieldValidator>
                <asp:RangeValidator Display="Dynamic" ID="AmtRangeVal" runat="server" ErrorMessage="At least 1 dollar and no more than the account balance!" Type="Currency" MinimumValue="1" MaximumValue="1" CssClass="error" ControlToValidate="txtWithdrawAmt"></asp:RangeValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Button ID="btnWithdraw" Text="Withdraw" runat="server" CssClass="btn btn-primary" OnClick="btnWithdraw_Click" />
            </div>
            <div class="col-sm-5">
                <asp:Label ID="lblWithdrawFail" class="text-info bg-info" Text="" runat="server" />
                <asp:Label class="text-info bg-info" ID="lblSuccess" Text="The transaction completed and the account balance has been updated" Visible="false" runat="server" />
            </div>
        </div>
    </div>

</asp:Content>

