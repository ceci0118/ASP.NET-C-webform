<%@ Page Title="" Language="C#" MasterPageFile="~/ACMasterPage.master" AutoEventWireup="true" CodeFile="CustomerManagement.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <div class="vertical-margin">
        <h1>Customer Management</h1>
    </div>
    <br />
    <div class="container no-padding">
        <div class="row vertical-margin">
            <div class="col-sm-2">
                <asp:Label Text="Customer Name" runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:TextBox runat="server" ID="txtName" />
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator runat="server" errormessage="Required!" CssClass="error" ControlToValidate="txtName"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="row vertical-margin">
            <div class="col-sm-2">
                <asp:Label Text="Initial Deposit" runat="server" />
            </div>
            <div class="col-sm-3">
                <asp:TextBox runat="server" ID="txtInitialDep" />
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator runat="server" errormessage="Required!" CssClass="error" Display="Dynamic" ControlToValidate="txtInitialDep"></asp:requiredfieldvalidator>
                <asp:CompareValidator ID="initialDepVal" Type="Currency" runat="server" ErrorMessage="Must be greater than 0!" CssClass="error" Display="Dynamic" ValueToCompare="0" Operator="GreaterThan" ControlToValidate="txtInitialDep"></asp:CompareValidator>
            </div>
        </div>
        <br />
        <asp:button text="Add Customer" class="btn btn-primary" runat="server" ID="btnAddCustomer" OnClick="btnAddCustomer_Click" />
    </div>
    <br />
    <h3>The following customers are currently in the system:</h3>
    <asp:table ID="tblCustomers" runat="server" CssClass="table" Width="550px">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Checking Account Balance</asp:TableHeaderCell>
            <asp:TableHeaderCell>Saving Account Balance</asp:TableHeaderCell>
            <asp:TableHeaderCell>Status</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow ID="tblVal" Visible="false" HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4">
                <asp:label text="No customer in the system yet" CssClass="error" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:table>
</asp:Content>