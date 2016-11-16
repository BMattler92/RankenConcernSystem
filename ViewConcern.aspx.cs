using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM Concern JOIN Person ON Concern.PersonID = Person.PersonID JOIN Employee ON Concern.EmployeeID = Employee.EmployeeID JOIN ConcernReason ON Concern.ConcernReasonID = ConcernReason.ConcernReasonID JOIN ContactMethod ON Concern.ContactMethodID = ContactMethod.ContactMethodID WHERE Person.LastName ='" + TextBox1.Text + "'";


    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM Concern JOIN Person ON Concern.PersonID = Person.PersonID JOIN Employee ON Concern.EmployeeID = Employee.EmployeeID JOIN ConcernReason ON Concern.ConcernReasonID = ConcernReason.ConcernReasonID JOIN ContactMethod ON Concern.ContactMethodID = ContactMethod.ContactMethodID WHERE Employee.EmployeeLastName ='" + TextBox2.Text + "'";
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM Concern JOIN Person ON Concern.PersonID = Person.PersonID JOIN Employee ON Concern.EmployeeID = Employee.EmployeeID JOIN ConcernReason ON Concern.ConcernReasonID = ConcernReason.ConcernReasonID JOIN ContactMethod ON Concern.ContactMethodID = ContactMethod.ContactMethodID WHERE Concern.ConcernDate ='" + TextBox3.Text + "'";
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM Concern JOIN Person ON Concern.PersonID = Person.PersonID JOIN Employee ON Concern.EmployeeID = Employee.EmployeeID JOIN ConcernReason ON Concern.ConcernReasonID = ConcernReason.ConcernReasonID JOIN ContactMethod ON Concern.ContactMethodID = ContactMethod.ContactMethodID";
    }
}