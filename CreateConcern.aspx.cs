using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI.WebControls;

public partial class CreateConcern : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnsubmitperson_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection("Provider=SQLOLEDB;Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ConcernReport.mdf;Integrated Security=True;Connect Timeout=30"))
        {
            //CONCERN TABLE
            SqlCommand person = new SqlCommand("INSERT INTO Person (FirstName, LastName, Email, Phone, RelationshipID) VALUES (@FirstName, @LastName, @Email, @Phone, @RelationshipID)");
            person.CommandType = CommandType.Text;
            person.Connection = connection;
            person.Parameters.AddWithValue("@FirstName", tbfname.Text);
            person.Parameters.AddWithValue("@LastName", tblname.Text);
            person.Parameters.AddWithValue("@Email", tbemail.Text);
            person.Parameters.AddWithValue("@Phone", tbphone.Text);
            person.Parameters.AddWithValue("@RelationshipID", ddlrelationship.SelectedValue);
            connection.Open();
            person.ExecuteNonQuery();
        }
        lblperson.Text = "Person Submitted.";
        ddlperson.DataBind();
    }

    protected void btnsubmitconcern_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection("Provider=SQLOLEDB;Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ConcernReport.mdf;Integrated Security=SSPi;Connect Timeout=30"))
        {
            //CONCERN TABLE
            SqlCommand concern = new SqlCommand("INSERT INTO Concern (PersonID, ContactMethodID, EmployeeID, ConcernReasonID, ConcernDate, ConcernDetails) VALUES (@PersonID, @ContactMethodID, @EmployeeID, @ConcernReasonID, @ConcernDate, @ConcernDetails)");
            concern.CommandType = CommandType.Text;
            concern.Connection = connection;
            concern.Parameters.AddWithValue("@PersonID", ddlperson.SelectedValue);
            concern.Parameters.AddWithValue("@ContactMethodID", ddlcontactmethod.SelectedValue);
            concern.Parameters.AddWithValue("@EmployeeID", ddlemployee.SelectedValue);
            concern.Parameters.AddWithValue("@ConcernReasonID", ddlconcernreason.SelectedValue);
            concern.Parameters.AddWithValue("@ConcernDate", tbconcerndate.Text);
            concern.Parameters.AddWithValue("@ConcernDetails", tbdetails.Text);
            connection.Open();
            concern.ExecuteNonQuery();
        }
        lblconcern.Text = "Concern Submitted.";
        ddlconcern.DataBind();
    }

    protected void btnsubmitaction_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection("Provider=SQLOLEDB;Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ConcernReport.mdf;Integrated Security=SSPi;Connect Timeout=30"))
        {
            //ACTION TABLE
            SqlCommand action = new SqlCommand("INSERT INTO Action (ConcernID, EmployeeID, ActionTaken, isResolutionAction, Date) VALUES (@ConcernID, @EmployeeID, @ActionTaken, @isResolutionAction, @Date)");
            action.CommandType = CommandType.Text;
            action.Connection = connection;
            action.Parameters.AddWithValue("@ConcernID", ddlconcern.SelectedValue);
            action.Parameters.AddWithValue("@EmployeeID", ddlemployee0.SelectedValue);
            action.Parameters.AddWithValue("@ActionTaken", tbaction.Text);
            action.Parameters.AddWithValue("@isResolutionAction", cbresolutionaction.Checked);
            action.Parameters.AddWithValue("@Date", tbactiondate.Text);
            connection.Open();
            action.ExecuteNonQuery();
        }
        lblaction.Text = "Concern Submitted.";
    }
}