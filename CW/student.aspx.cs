using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCountry = ctl15.SelectedValue;
            if (ctl15.SelectedValue.ToLower() == "all")
            {
                ctl00.SelectCommand = "SELECT COUNTRY, EMAIL, DOB, CONTACT, NAME, STUDENT_ID FROM STUDENT";
            } else
            {
                ctl00.SelectCommand = $"SELECT COUNTRY, EMAIL, DOB, CONTACT, NAME, STUDENT_ID FROM STUDENT WHERE COUNTRY = '{selectedCountry}'";
            }
            Students_Grid.DataBind();
        }   


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Students_Grid.EditIndex == e.Row.RowIndex)
                {
                    LinkButton btnEdit = (LinkButton)e.Row.FindControl("btnEdit");
                    LinkButton btnUpdate = (LinkButton)e.Row.FindControl("btnUpdate");
                    LinkButton btnCancel = (LinkButton)e.Row.FindControl("btnCancel");
                    LinkButton btnDelete = (LinkButton)e.Row.FindControl("btnDelete");

                    if (btnEdit != null)
                    {
                        btnEdit.Visible = false;
                        btnDelete.Visible = false;
                        btnCancel.Visible = true;
                        btnUpdate.Visible = true;
                    }
                    else if (btnUpdate != null)
                    {
                        btnUpdate.Visible = false;
                        btnEdit.Visible = true;
                        btnCancel.Visible = false;
                        btnDelete.Visible = true;
                    }
                }
                else
                {
                    LinkButton btnDelete = (LinkButton)e.Row.FindControl("btnDelete");
                    if (btnDelete != null)
                    {
                        btnDelete.Attributes["onclick"] = "return confirm('Are you sure you want to delete this row?');";
                    }
                }
            }
        }

        protected void Form_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

            if (e.Exception != null)
            {

                string script = "alert('Error: Something went wrong. Please check input values!!');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                e.ExceptionHandled = true;
            }
            else
            {
                // Handle other database errors
            }
        }
    }
}