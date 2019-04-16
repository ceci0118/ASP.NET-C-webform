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
                drpWithdraw.Items.Add(item);
            }
        }
        lblSuccess.Visible = false;
    }

    protected void drpWithdraw_SelectedIndexChanged(object sender, EventArgs e)
    {
        // read the customer from dropdownlist
        int selectedIndex = drpWithdraw.SelectedIndex;

        // display the balance of the selected customer
        Customer customer = customers[selectedIndex - 1];

        lblCB.Text = customer.Checking.Balance.ToString("C2");
        lblSB.Text = customer.Saving.Balance.ToString("C2");

        if(customer.Checking.Balance != 0)
        {
            AmtRangeVal.MaximumValue = customer.Checking.Balance.ToString();
        }
        
    }

    protected void btnWithdraw_Click(object sender, EventArgs e)
    {
        //lblWithdrawFail.Text = "";

        if (Page.IsValid)
        {
            // display the balance of the selected customer
            int selectedIndex = drpWithdraw.SelectedIndex;
            Customer customer = customers[selectedIndex - 1];

            //checking or saving radio button
            Account account = customer.Checking;
            if (checking.Checked)
            {
                account = customer.Checking;
            }
            else if(saving.Checked)
            {
                account = customer.Saving;
            }

            //read the deposit amount from customer
            double amt = double.Parse(txtWithdrawAmt.Text);
            Transaction transaction = new Transaction(amt, TransactionType.WITHDRAW);

            //deposit to checking or saving account
            TransactionResult result = account.Withdraw(transaction);
            if(result == TransactionResult.EXCEED_MAX_WITHDRAW_AMOUNT)
            {
                lblWithdrawFail.Text = "The transaction failed:" + "\n" + TransactionResult.EXCEED_MAX_WITHDRAW_AMOUNT;
                lblSuccess.Visible = false;
            } 
            else if(result == TransactionResult.SUCCESS)
            {
                lblWithdrawFail.Text = "";
                lblCB.Text = customer.Checking.Balance.ToString("C2");
                lblSB.Text = customer.Saving.Balance.ToString("C2");

                txtWithdrawAmt.Text = "";
                lblSuccess.Visible = true;
            }
            else if(result == TransactionResult.INSUFFICIENT_FUND)
            {
                AmtRangeVal.IsValid = false;
            }
        }

    }


    protected void checking_CheckedChanged(object sender, EventArgs e)
    {
        int selectedIndex = drpWithdraw.SelectedIndex;
        Customer customer = customers[selectedIndex - 1];
        
        if (checking.Checked){
            AmtRangeVal.MaximumValue = customer.Checking.Balance.ToString();
        }
    }

    protected void saving_CheckedChanged(object sender, EventArgs e)
    {
        int selectedIndex = drpWithdraw.SelectedIndex;
        Customer customer = customers[selectedIndex - 1];

        if (saving.Checked)
        {
            AmtRangeVal.MaximumValue = customer.Saving.Balance.ToString();
        }
    }
}