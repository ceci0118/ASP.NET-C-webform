using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lab5_new.Entities;
using System.Globalization;

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
                drpActivity.Items.Add(item);
            }
        }
    }

    protected void drpActivity_SelectedIndexChanged(object sender, EventArgs e)
    {
        // read the customer from dropdownlist
        int selectedIndex = drpActivity.SelectedIndex;
        Customer customer = customers[selectedIndex - 1];

        activityTable.Visible = true;

        

        foreach (Transaction t in customer.Checking.TransactionHistory)
        {
            TableRow row = new TableRow();
            TableCell date = new TableCell();
            TableCell amount = new TableCell();
            TableCell type = new TableCell();

            date.Text = datetime_convert(t.TransactionDate);
            amount.Text = t.Amount.ToString("C2");
            type.Text = t.Type.ToString();

            row.Cells.Add(date);
            row.Cells.Add(amount);
            row.Cells.Add(type);
            tblChecking.Rows.Add(row);
        }

        foreach (Transaction s in customer.Saving.TransactionHistory)
        {
            TableRow row = new TableRow();
            TableCell date = new TableCell();
            TableCell amount = new TableCell();
            TableCell type = new TableCell();

            date.Text = datetime_convert(s.TransactionDate);
            amount.Text = s.Amount.ToString("C2");
            type.Text = s.Type.ToString();

            row.Cells.Add(date);
            row.Cells.Add(amount);
            row.Cells.Add(type);
            tblSaving.Rows.Add(row);
        }
    }

    protected string datetime_convert(DateTime d)
    {
        string dayofweek = d.DayOfWeek.ToString();
        string month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(d.Month);
        string date = d.Day.ToString();
        string year = d.Year.ToString();

        string result = dayofweek + ", " + month + " " + date + ", " + year;
        return result;
    }
}