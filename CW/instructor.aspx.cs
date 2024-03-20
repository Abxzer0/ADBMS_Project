using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string value = TextBox1.Text.Trim().ToLower();
            if (value == "" || value == null)
            {
                SqlDataSource1.SelectCommand = "SELECT INSTRUCTOR_ID, NAME FROM INSTRUCTOR";
            }
            else {
                SqlDataSource1.SelectCommand = $"SELECT INSTRUCTOR_ID, NAME FROM INSTRUCTOR WHERE LOWER(NAME) LIKE '%{value}%'";
            }
            Instuctor_Grid.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                if (Instuctor_Grid.EditIndex == e.Row.RowIndex)
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
                else {
                    LinkButton btnDelete = (LinkButton)e.Row.FindControl("btnDelete");
                    if (btnDelete != null)
                    {
                        btnDelete.Attributes["onclick"] = "return confirm('Are you sure you want to delete this row?');";
                    }
                }
            }
        }
    }
}