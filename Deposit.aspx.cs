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
                drpDeposit.Items.Add(item);
            }
        }

        lblSuccess.Visible = false;
    }

    protected void drpDeposit_SelectedIndexChanged(object sender, EventArgs e)
    {
        // read the customer from dropdownlist
        int selectedIndex = drpDeposit.SelectedIndex;

        // display the balance of the selected customer
        Customer customer = customers[selectedIndex - 1];

        cBalance.Text = customer.Checking.Balance.ToString("C2");
        sBalance.Text = customer.Saving.Balance.ToString("C2");
    }

    protected void btnDeposit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // display the balance of the selected customer
            int selectedIndex = drpDeposit.SelectedIndex;
            Customer customer = customers[selectedIndex - 1];

            //read the deposit amount from customer
            double amt = double.Parse(depAmt.Text);
            Transaction transaction = new Transaction(amt, TransactionType.DEPOSIT);

            //checking or saving radio button
            Account account = null;
            if (rdbChecking.Checked)
            {
                account = customer.Checking;
            }
            else
            {
                account = customer.Saving;
            }

            //deposit to checking or saving account
            account.Deposit(transaction);
            cBalance.Text = customer.Checking.Balance.ToString("C2");
            sBalance.Text = customer.Saving.Balance.ToString("C2");

            depAmt.Text = "";
            lblSuccess.Visible = true;
        }
    }
}