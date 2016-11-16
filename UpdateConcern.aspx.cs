using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateConcern : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmitaction_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection("Data Source = SAM_LAPTOP; Integrated Security = SSPI; Initial Catalog = ConcernReport"))
        {
            //ACTION TABLE
            SqlCommand action = new SqlCommand("INSERT INTO Action (ConcernID, EmployeeID, ActionTaken, isResolutionAction, Date) VALUES (@ConcernID, @EmployeeID, @ActionTaken, @isResolutionAction, @Date)");
            action.CommandType = CommandType.Text;
            action.Connection = connection;
            action.Parameters.AddWithValue("@ConcernID", ddlconcern.SelectedValue);
            action.Parameters.AddWithValue("@EmployeeID", ddlemployee.SelectedValue);
            action.Parameters.AddWithValue("@ActionTaken", tbaction.Text);
            action.Parameters.AddWithValue("@isResolutionAction", cbresolutionaction.Checked);
            action.Parameters.AddWithValue("@Date", tbactiondate.Text);
            connection.Open();
            action.ExecuteNonQuery();
        }
        lblaction.Text = "Concern Updated.";
    }
}