using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lab5_new.Entities;

public partial class _Default : System.Web.UI.Page
{
    List<Customer> customers;

    protected void Page_Load(object sender, EventArgs e)
    {
        customers = (List<Customer>)Session["Customers"];

        if (customers == null)
        {
            Page.Response.Redirect("CustomerManagement.aspx");
        }

        if (!Page.IsPostBack)
        {
            foreach (Customer c in customers)
            {
                ListItem item = new ListItem();
                item.Text = c.Name;
                drpTransfer.Items.Add(item);
            }
        }

        lblSuccess.Visible = false;
    }

    protected void drpTransfer_SelectedIndexChanged(object sender, EventArgs e)
    {
        // read the customer from dropdownlist
        int selectedIndex = drpTransfer.SelectedIndex;

        // display the balance of the selected customer
        Customer customer = customers[selectedIndex - 1];

        lblCB.Text = customer.Checking.Balance.ToString("C2");
        lblSB.Text = customer.Saving.Balance.ToString("C2");

        if(customer.Checking.Balance != 0)
        {
            AmtRangeVal.MaximumValue = customer.Checking.Balance.ToString();
        }
        
    }

    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // display the balance of the selected customer
            int selectedIndex = drpTransfer.SelectedIndex;
            Customer customer = customers[selectedIndex - 1];

            //read the transfer amount from customer
            double amt = double.Parse(txtTransferAmt.Text);
            Transaction transaction_in = new Transaction(amt, TransactionType.TRANSFER_IN);
            Transaction transaction_out = new Transaction(amt, TransactionType.TRANSFER_OUT);

            //checking or saving radio button
            if (rdbCtoS.Checked)
            {
                TransactionResult s = customer.Checking.Withdraw_base(transaction_out);
                if(s == TransactionResult.SUCCESS)
                {
                    customer.Saving.Deposit(transaction_in);
                    lblTransferFail.Text = "";
                    lblSuccess.Visible = true;
                }
                else if(s == TransactionResult.EXCEED_MAX_WITHDRAW_AMOUNT)
                {
                    lblTransferFail.Text = "The transaction failed:" + "\n" + TransactionResult.EXCEED_MAX_WITHDRAW_AMOUNT;
                }
                else if (s == TransactionResult.INSUFFICIENT_FUND)
                {
                    AmtRangeVal.IsValid = false;
                }
            }
            else if(rdbStoC.Checked)
            {
                TransactionResult r = customer.Saving.Withdraw_base(transaction_out);
                if(r == TransactionResult.SUCCESS)
                {
                    customer.Checking.Deposit(transaction_in);
                    lblTransferFail.Text = "";
                    lblSuccess.Visible = true;
                }
                else if (r == TransactionResult.EXCEED_MAX_WITHDRAW_AMOUNT)
                {
                    lblTransferFail.Text = "The transaction failed:" + "\n" + TransactionResult.EXCEED_MAX_WITHDRAW_AMOUNT;
                }
                else if (r == TransactionResult.INSUFFICIENT_FUND)
                {
                    AmtRangeVal.IsValid = false;
                }
            }

            lblCB.Text = customer.Checking.Balance.ToString("C2");
            lblSB.Text = customer.Saving.Balance.ToString("C2");

            txtTransferAmt.Text = "";
        }
    }

    protected void saving_CheckedChanged(object sender, EventArgs e)
    {
        int selectedIndex = drpTransfer.SelectedIndex;
        Customer customer = customers[selectedIndex - 1];

        if (rdbStoC.Checked && customer.Saving.Balance != 0)
        {
            AmtRangeVal.MaximumValue = customer.Saving.Balance.ToString();
        }
    }

    protected void checking_CheckedChanged(object sender, EventArgs e)
    {
        int selectedIndex = drpTransfer.SelectedIndex;
        Customer customer = customers[selectedIndex - 1];

        if (rdbCtoS.Checked && customer.Checking.Balance != 0)
        {
            AmtRangeVal.MaximumValue = customer.Checking.Balance.ToString();
        }
    }
}