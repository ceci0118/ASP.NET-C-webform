<%@ Page Title="" Language="C#" MasterPageFile="~/ACMasterPage.master" AutoEventWireup="true" CodeFile="Deposit.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Deposit Fund</h1>
    <br />
    <div class="container no-padding">
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Customer Name:" runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:DropDownList runat="server" ID="drpDeposit" AutoPostBack="true" OnSelectedIndexChanged="drpDeposit_SelectedIndexChanged">
                    <asp:ListItem Text="Select Customer ..." Value="0" />
                </asp:DropDownList>
            </div>
            <div class="col-sm-2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="drpDeposit" CssClass="error" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Checking Account Balance: " runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:Label Text="" runat="server" ID="cBalance" />
            </div>
        </div><div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Saving Account Balance: " runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:Label Text="" runat="server" ID="sBalance" />
            </div>
        </div>
        <br />
        <br />
        <asp:RadioButton GroupName="rdbAccount" Text="To Checking Count" runat="server" ID="rdbChecking" Checked="true" /><br />
        <asp:RadioButton GroupName="rdbAccount" Text="To Saving Count" runat="server" ID="rdbSaving" /><br />
        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Label Text="Deposit Amount: " runat="server" />
            </div>
            <div class="col-sm-1">
                <asp:TextBox Width="60px" runat="server" ID="depAmt" />
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Required!" CssClass="error" ControlToValidate="depAmt"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" Type="Currency" runat="server" ErrorMessage="Must greater than 0!" ControlToValidate="depAmt" ValueToCompare="0" Operator="GreaterThan" CssClass="error" Display="Dynamic"></asp:CompareValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-3">
                <asp:Button Text="Deposit" ID="btnDeposit" runat="server" CssClass="btn btn-primary" OnClick="btnDeposit_Click" />
            </div>
            <div class="col-sm-5">
                <asp:Label class="text-success bg-success" ID="lblSuccess" Text="The transaction completed and the account balance has been updated" Visible="false" runat="server" />
            </div>
        </div>
    </div>
    

</asp:Content>

