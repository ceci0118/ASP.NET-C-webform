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

        if (!IsPostBack)
        {
            customers = new List<Customer>();
        }
        else
        {
            customers = Session["Customers"] as List<Customer>;
        }

        showCustomers();
    }

    
    protected void btnAddCustomer_Click(object sender, EventArgs e)
    {
        
        if (Session["Customers"] != null)
        {
            customers = (List<Customer>)Session["Customers"];
           
        }
        else
        {
            tblVal.Visible = true;
            customers = new List<Customer>();
        }

        string name = txtName.Text;
        double initialDep = double.Parse(txtInitialDep.Text);

        Customer customer = new Customer(name);
        customer.Saving = new SavingAccount(customer);
        customer.Checking = new CheckingAccount(customer);
        customers.Add(customer);

        Transaction initial = new Transaction(initialDep, TransactionType.DEPOSIT);
        customer.Saving.Deposit(initial);

        Session["Customers"] = customers;

        txtName.Text = "";
        txtInitialDep.Text = "";

        showCustomers();
    }

    
    private void showCustomers()
    {

        if(Session["Customers"] == null)
        {
            tblVal.Visible = true;
        }
        else
        {
            tblVal.Visible = false;

            customers = (List<Customer>)Session["Customers"];

            for (int i = tblCustomers.Rows.Count - 1; i > 0; i--)
            {
                tblCustomers.Rows.RemoveAt(i);
            }

            foreach (Customer c in customers)
            {
                TableRow row = new TableRow();
                TableCell tblName = new TableCell();
                TableCell tblCB = new TableCell();
                TableCell tblSB = new TableCell();
                TableCell tblStatus = new TableCell();

                tblName.Text = c.Name;
                tblCB.Text = c.Checking.Balance.ToString("C2");
                tblSB.Text = c.Saving.Balance.ToString("C2");
                tblStatus.Text = c.Status.ToString();

                row.Cells.Add(tblName);
                row.Cells.Add(tblCB);
                row.Cells.Add(tblSB);
                row.Cells.Add(tblStatus);
                tblCustomers.Rows.Add(row);
            }
        }

        
    }
    
}