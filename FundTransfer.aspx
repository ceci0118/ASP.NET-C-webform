<%@ Page Title="" Language="C#" MasterPageFile="~/ACMasterPage.master" AutoEventWireup="true" CodeFile="FundTransfer.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Transfer Fund</h1>
    <br />
    <div class="container no-padding">
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Customer Name:" runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:DropDownList runat="server" ID="drpTransfer" AutoPostBack="true" OnSelectedIndexChanged="drpTransfer_SelectedIndexChanged">
                    <asp:ListItem Text="Select Customer ..." Value="0" />
                </asp:DropDownList>
            </div>
            <div class="col-sm-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="drpTransfer" CssClass="error" InitialValue="0"></asp:RequiredFieldValidator>
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
        <asp:RadioButton ID="rdbCtoS" GroupName="account" Text="From Checking to Saving" Checked="true" AutoPostBack="true" OnCheckedChanged="checking_CheckedChanged" runat="server" />
        <br />
        <asp:RadioButton ID="rdbStoC" GroupName="account" Text="From Saving to Checking" AutoPostBack="true" OnCheckedChanged="saving_CheckedChanged" runat="server" />

        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Transfer Amount: " runat="server" />
            </div>
            <div class="col-sm-1">
                <asp:TextBox Width="60px" ID="txtTransferAmt" runat="server" />
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Required!" CssClass="error" ControlToValidate="txtTransferAmt"></asp:RequiredFieldValidator>
                <asp:RangeValidator Display="Dynamic" ID="AmtRangeVal" runat="server" ErrorMessage="At least 1 dollar and no more than the account balance!" Type="Currency" MinimumValue="1" MaximumValue="1" CssClass="error" ControlToValidate="txtTransferAmt"></asp:RangeValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Button ID="btnTransfer" Text="Transfer" runat="server" CssClass="btn btn-primary" OnClick="btnTransfer_Click" />
            </div>
            <div class="col-sm-5">
                <asp:Label ID="lblTransferFail" class="text-info bg-info" Text="" runat="server" />
                <asp:Label class="text-success bg-success" ID="lblSuccess" Text="The transaction completed and the account balance has been updated" Visible="false" runat="server" />
            </div>
        </div>
    </div>

</asp:Content>

